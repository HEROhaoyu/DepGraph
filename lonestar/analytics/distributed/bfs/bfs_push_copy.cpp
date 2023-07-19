/*
 * This file belongs to the Galois project, a C++ library for exploiting
 * parallelism. The code is being released under the terms of the 3-Clause BSD
 * License (a copy is located in LICENSE.txt at the top-level directory).
 *
 * Copyright (C) 2018, The University of Texas at Austin. All rights reserved.
 * UNIVERSITY EXPRESSLY DISCLAIMS ANY AND ALL WARRANTIES CONCERNING THIS
 * SOFTWARE AND DOCUMENTATION, INCLUDING ANY WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR ANY PARTICULAR PURPOSE, NON-INFRINGEMENT AND WARRANTIES OF
 * PERFORMANCE, AND ANY WARRANTY THAT MIGHT OTHERWISE ARISE FROM COURSE OF
 * DEALING OR USAGE OF TRADE.  NO WARRANTY IS EITHER EXPRESS OR IMPLIED WITH
 * RESPECT TO THE USE OF THE SOFTWARE OR DOCUMENTATION. Under no circumstances
 * shall University be liable for incidental, special, indirect, direct or
 * consequential damages or loss of profits, interruption of business, or
 * related expenses which may arise from use of Software or Documentation,
 * including but not limited to those resulting from defects in Software and/or
 * Documentation, or loss or inaccuracy of data of any kind.
 */

#include "DistBench/Output.h"
#include "DistBench/Start.h"
#include "galois/DistGalois.h"
#include "galois/gstl.h"
#include "galois/DReducible.h"
#include "galois/DTerminationDetector.h"
#include "galois/runtime/Tracer.h"

#include <iostream>
#include <string>
#include <thread>
#include <cstdio>
#include <map>

#ifdef GALOIS_ENABLE_GPU
#include "bfs_push_cuda.h"
struct CUDA_Context *cuda_ctx;
#else
enum
{
  CPU,
  GPU_CUDA
};
int personality = CPU;
#endif

constexpr static const char *const REGION_NAME = "BFS";

/******************************************************************************/
/* 开启线程 */
/******************************************************************************/
bool threadFinished = false;
std::string result;
std::map<int, double> vertexMap;
std::thread t1;
// t1线程函数
void threadFunction();


/******************************************************************************/
/* Declaration of command line arguments */
/******************************************************************************/

namespace cll = llvm::cl;

static cll::opt<unsigned int> maxIterations("maxIterations",
                                            cll::desc("Maximum iterations: "
                                                      "Default 1000"),
                                            cll::init(1000));

static cll::opt<uint64_t>
    startNode("startNode", cll::desc("ID of the source node"), cll::init(0));

static cll::opt<uint32_t>
    delta("delta",
          cll::desc("Shift value for the delta step (default value 0)"),
          cll::init(0));

static cll::opt<bool> mindspore("mindspore", cll::desc("Write result (default false)"),
                                cll::init(false));
static cll::opt<std::string>
    npu_input("npu_input",
          cll::desc("npu端接收到的数据集的输入路径"),
          cll::init(""));      
static cll::opt<std::string>
    npu_output("npu_output",
          cll::desc("npu端接收到的数据集的输出路径"),
          cll::init(""));                                 
static cll::opt<uint32_t>
    npu_edge_num("npu_edge_num",
          cll::desc("npu端接收到的数据集的稠密子图的边数"),
          cll::init(0));                                 

// static cll::opt<float>
//     ratio_mindspore("ratio_mindspore", cll::desc("ratio_mindspore"), cll::init(0.1));

// static cll::opt<uint32_t>
//     topN("topN", cll::desc("topN"), cll::init(10000)); // 这里的topN是一个参数，用于指定输出的前topN个节点

enum Exec
{
  Sync,
  Async
};

static cll::opt<Exec> execution(
    "exec", cll::desc("Distributed Execution Model (default value Async):"),
    cll::values(clEnumVal(Sync, "Bulk-synchronous Parallel (BSP)"),
                clEnumVal(Async, "Bulk-asynchronous Parallel (BASP)")),
    cll::init(Async));

/******************************************************************************/
/* Graph structure declarations + other initialization */
/******************************************************************************/

bool ls_flag; // 这个标志用来标记当前进程是否是mindspore进程.程序设定每个host的第一个进程负责开启mindspre通信

const uint32_t infinity = std::numeric_limits<uint32_t>::max() / 4;

struct NodeData
{
  std::atomic<uint32_t> dist_current;
  uint32_t dist_old;
};

galois::DynamicBitSet bitset_dist_current; // 这个是一个动态的bitset
typedef galois::graphs::DistGraph<NodeData, void> Graph;
typedef typename Graph::GraphNode GNode;

std::unique_ptr<galois::graphs::GluonSubstrate<Graph>> syncSubstrate;

std::vector<GNode> mind_graph;
struct mindsporeNodeData
{ // 因为NodeData有个原子类型，没法copy，我就做了个折中的数据结构去保存数据
  uint32_t dist_current;
  uint32_t dist_old;
};
std::vector<mindsporeNodeData> mind_dist; // 用来将最新值更新到文件

galois::DynamicBitSet mind_bitset_dist_current;

#include "bfs_push_sync.hh"



/******************************************************************************/
/* Algorithm structures */
/******************************************************************************/

struct InitializeGraph
{ // 根据边关系初始化图
  const uint32_t &local_infinity;
  cll::opt<uint64_t> &local_src_node;
  Graph *graph;

  InitializeGraph(cll::opt<uint64_t> &_src_node, const uint32_t &_infinity,
                  Graph *_graph)
      : local_infinity(_infinity), local_src_node(_src_node), graph(_graph) {}

  void static go(Graph &_graph)
  {
    const auto &allNodes = _graph.allNodesRange(); // 图中所有的节点

    if (personality == GPU_CUDA)
    {
#ifdef GALOIS_ENABLE_GPU
      std::string impl_str(
          syncSubstrate->get_run_identifier("InitializeGraph_"));
      galois::StatTimer StatTimer_cuda(impl_str.c_str(), REGION_NAME);
      StatTimer_cuda.start();
      InitializeGraph_allNodes_cuda(infinity, startNode, cuda_ctx);
      StatTimer_cuda.stop();
#else
      abort();
#endif
    }
    else if (personality == CPU)
    {
      galois::do_all(                                        // 这里的do_all是galois的一个并行操作，这里的操作是对所有的节点进行初始化
          galois::iterate(allNodes.begin(), allNodes.end()), // 这里的iterate是galois的一个迭代器，用来遍历所有的节点
          InitializeGraph{startNode, infinity, &_graph}, galois::no_stats(),
          galois::loopname(                                                   // 这里的loopname是galois的一个函数，用来标记这个操作的名字
              syncSubstrate->get_run_identifier("InitializeGraph").c_str())); //
    }
  }

  void operator()(GNode src) const
  {
    NodeData &sdata = graph->getData(src);
    sdata.dist_current =
        (graph->getGID(src) == local_src_node) ? 0 : local_infinity;
    sdata.dist_old =
        (graph->getGID(src) == local_src_node) ? 0 : local_infinity;
  }
};

template <bool async>
struct FirstItr_BFS
{ // 这份分布式代码里，单源的push类算法好像都有这个操作
  // 这样操作的原因可能因为第一次遍历的并行度太低了，相当于是启动这个bfs，最开始的一轮不需要并行操作
  Graph *graph;

  FirstItr_BFS(Graph *_graph) : graph(_graph) {}

  void static go(Graph &_graph)
  {
    uint32_t __begin, __end;
    if (_graph.isLocal(startNode))
    { // 判断该节点是否在当前host
      __begin = _graph.getLID(startNode);
      __end = __begin + 1;
    }
    else
    {
      __begin = 0;
      __end = 0;
    }
    syncSubstrate->set_num_round(0);
    if (personality == GPU_CUDA)
    {
#ifdef GALOIS_ENABLE_GPU
      std::string impl_str(syncSubstrate->get_run_identifier("BFS"));
      galois::StatTimer StatTimer_cuda(impl_str.c_str(), REGION_NAME);
      StatTimer_cuda.start();
      FirstItr_BFS_cuda(__begin, __end, cuda_ctx);
      StatTimer_cuda.stop();
#else
      abort();
#endif
    }
    else if (personality == CPU)
    {
      // one node
      galois::do_all(
          galois::iterate(__begin, __end), FirstItr_BFS{&_graph},
          galois::no_stats(),
          galois::loopname(syncSubstrate->get_run_identifier("BFS").c_str()));
    }

    syncSubstrate->sync<writeDestination, readSource, Reduce_min_dist_current,
                        Bitset_dist_current, async>("BFS");

    galois::runtime::reportStat_Tsum( //
        REGION_NAME, syncSubstrate->get_run_identifier("NumWorkItems"),
        __end - __begin);
  }

  void operator()(GNode src) const
  {
    NodeData &snode = graph->getData(src);
    snode.dist_old = snode.dist_current;

    for (auto jj : graph->edges(src))
    {
      GNode dst = graph->getEdgeDst(jj);
      auto &dnode = graph->getData(dst);
      uint32_t new_dist = 1 + snode.dist_current;
      uint32_t old_dist = galois::atomicMin(dnode.dist_current, new_dist); // 注意不要被这个函数名迷惑了，这个函数返回的是原来的dnode.dist_current值,但是atomicMin可能改变dnode.dist_current
      if (old_dist > new_dist)
        bitset_dist_current.set(dst); //
    }
  }
};

template <bool async>
struct BFS
{
  uint32_t local_priority;
  Graph *graph;
  using DGTerminatorDetector =                                             // 在多个主机上获取某些值的和的分布式求和,有两种方法
      typename std::conditional<async, galois::DGTerminator<unsigned int>, // conditional是galois的一个函数，类似于三目运算符，如果是async，那么就是第一个，否则就是第二个
                                galois::DGAccumulator<unsigned int>>::type;
  using DGAccumulatorTy = galois::DGAccumulator<unsigned int>;

  DGTerminatorDetector &active_vertices;
  DGAccumulatorTy &work_edges;

  BFS(uint32_t _local_priority, Graph *_graph, DGTerminatorDetector &_dga,
      DGAccumulatorTy &_work_edges)
      : local_priority(_local_priority), graph(_graph), active_vertices(_dga),
        work_edges(_work_edges) {}

  void static go(Graph &_graph)
  {
    // vector<vector<bool>> flag1(m,vector<bool>(n,false));
    // 使用fill函数填充二维vector

    FirstItr_BFS<async>::go(_graph);

    unsigned _num_iterations = 1;

    const auto &nodesWithEdges = _graph.allNodesWithEdgesRange();

    uint32_t priority;
    if (delta == 0)
      priority = std::numeric_limits<uint32_t>::max(); // numeric_limits是c++的一个库，用来获取数据类型的最大值
    else
      priority = 0;
    DGTerminatorDetector dga;
    DGAccumulatorTy work_edges;

    do
    {

      // if (work_edges.reduce() == 0)
      priority += delta;

      syncSubstrate->set_num_round(_num_iterations); // Set the round number for use in the run identifier.
      dga.reset();
      work_edges.reset();
      if (personality == GPU_CUDA)
      {
#ifdef GALOIS_ENABLE_GPU
        std::string impl_str(syncSubstrate->get_run_identifier("BFS"));
        galois::StatTimer StatTimer_cuda(impl_str.c_str(), REGION_NAME);
        StatTimer_cuda.start();
        unsigned int __retval = 0;
        unsigned int __retval2 = 0;
        BFS_nodesWithEdges_cuda(__retval, __retval2, priority, cuda_ctx);
        dga += __retval;
        work_edges += __retval2;
        StatTimer_cuda.stop();
#else
        abort();
#endif
      }
      else if (personality == CPU)
      {
        galois::do_all(
            galois::iterate(nodesWithEdges),
            BFS(priority, &_graph, dga, work_edges), galois::steal(),
            galois::no_stats(), // Turn off the collection of performance statistics even when galois::loopname is given.
            galois::loopname(syncSubstrate->get_run_identifier("BFS").c_str()));
      }
      if ((converge == false) || (0 == (unsigned long)dga.read_local()))
      {
        syncSubstrate->sync<writeDestination, readSource, Reduce_min_dist_current,
                            Bitset_dist_current, async>("BFS");
        // 传递参数给 mindspore
        // 是cpu端算完会更新value嘛，所以需要实时更新，cpu算完一个超步，就传一次，然后mindspore算完一个超步也传一次回cpu
      }

      galois::runtime::reportStat_Tsum( //
          REGION_NAME, syncSubstrate->get_run_identifier("NumWorkItems"),
          (unsigned long)work_edges.read_local());

      ++_num_iterations;
      if (mindspore && ls_flag)
      {
        if(!threadFinished)
        {
            std::cout << "线程未结束，继续等待" << std::endl;
            break;
        }
        else
        {
            std::cout << "线程已结束" << std::endl;
            for(const auto& vertex : vertexMap){
                std::cout << "vertex: " << vertex.first << " dist_current: " << vertex.second << std::endl;
            }
        }
      }
    } while ((async || (_num_iterations < maxIterations)) &&
             dga.reduce(syncSubstrate->get_run_identifier())); // get_run_identifier:使用set run和set round获取运行标识符，并在传入的数字标识符之外追加传入的字符串。
                                                               // Reduce data across all hosts, saves the value, and returns the reduced value
    galois::runtime::reportStat_Tmax(
        REGION_NAME,
        "NumIterations_" + std::to_string(syncSubstrate->get_run_num()),
        (unsigned long)_num_iterations);
  }

  void operator()(GNode src) const
  {
    NodeData &snode = graph->getData(src);

    if (snode.dist_old > snode.dist_current)
    {
      active_vertices += 1;

      if (local_priority > snode.dist_current)
      {
        snode.dist_old = snode.dist_current;

        for (auto jj : graph->edges(src))
        {
          work_edges += 1;

          GNode dst = graph->getEdgeDst(jj);
          auto &dnode = graph->getData(dst);
          uint32_t new_dist = 1 + snode.dist_current;
          uint32_t old_dist = galois::atomicMin(dnode.dist_current, new_dist);
          if (old_dist > new_dist)
            bitset_dist_current.set(dst); // 分布式程序可能有多个host运行程序，这句话是用于分布式通信，设置活跃节点
        }
      }
    }
  }
};

/******************************************************************************/
/* Sanity check operators */
/******************************************************************************/

/* Prints total number of nodes visited + max distance */
struct BFSSanityCheck
{
  const uint32_t &local_infinity;
  Graph *graph;

  galois::DGAccumulator<uint64_t> &DGAccumulator_sum;
  galois::DGReduceMax<uint32_t> &DGMax;

  BFSSanityCheck(const uint32_t &_infinity, Graph *_graph,
                 galois::DGAccumulator<uint64_t> &dgas,
                 galois::DGReduceMax<uint32_t> &dgm)
      : local_infinity(_infinity), graph(_graph), DGAccumulator_sum(dgas),
        DGMax(dgm) {}

  void static go(Graph &_graph, galois::DGAccumulator<uint64_t> &dgas,
                 galois::DGReduceMax<uint32_t> &dgm)
  {
    dgas.reset();
    dgm.reset();

    if (personality == GPU_CUDA)
    {
#ifdef GALOIS_ENABLE_GPU
      uint64_t sum;
      uint32_t max;
      BFSSanityCheck_masterNodes_cuda(sum, max, infinity, cuda_ctx);
      dgas += sum;
      dgm.update(max);
#else
      abort();
#endif
    }
    else
    {
      galois::do_all(galois::iterate(_graph.masterNodesRange().begin(),
                                     _graph.masterNodesRange().end()),
                     BFSSanityCheck(infinity, &_graph, dgas, dgm),
                     galois::no_stats(), galois::loopname("BFSSanityCheck"));
    }

    // uint64_t num_visited  = dgas.reduce();
    // uint32_t max_distance = dgm.reduce();

    // Only host 0 will print the info
    // if (galois::runtime::getSystemNetworkInterface().ID == 0) {
    //   galois::gPrint("Number of nodes visited from source ", startNode, " is ",
    //                  num_visited, "\n");
    //   galois::gPrint("Max distance from source ", startNode, " is ",
    //                  max_distance, "\n");
    // }
  }

  void operator()(GNode src) const
  {
    NodeData &src_data = graph->getData(src);

    if (src_data.dist_current < local_infinity)
    {
      DGAccumulator_sum += 1;
      DGMax.update(src_data.dist_current);
    }
  }
};

/******************************************************************************/
/* Make results */
/******************************************************************************/

std::vector<uint32_t> makeResultsCPU(std::unique_ptr<Graph> &hg)
{
  std::vector<uint32_t> values;

  values.reserve(hg->numMasters());
  for (auto node : hg->masterNodesRange())
  {
    values.push_back(hg->getData(node).dist_current);
  }

  return values;
}

#ifdef GALOIS_ENABLE_GPU
std::vector<uint32_t> makeResultsGPU(std::unique_ptr<Graph> &hg)
{
  std::vector<uint32_t> values;

  values.reserve(hg->numMasters());
  for (auto node : hg->masterNodesRange())
  {
    values.push_back(get_node_dist_current_cuda(cuda_ctx, node));
  }

  return values;
}
#else
std::vector<uint32_t> makeResultsGPU(std::unique_ptr<Graph> & /*unused*/)
{
  abort();
}
#endif

std::vector<uint32_t> makeResults(std::unique_ptr<Graph> &hg)
{
  switch (personality)
  {
  case CPU:
    return makeResultsCPU(hg);
  case GPU_CUDA:
    return makeResultsGPU(hg);
  default:
    abort();
  }
}

/******************************************************************************/
/* Main */
/******************************************************************************/

constexpr static const char *const name =
    "BFS - Distributed Heterogeneous with "
    "worklist.";
constexpr static const char *const desc = "BFS on Distributed Galois.";
constexpr static const char *const url = nullptr;

int main(int argc, char **argv)
{
  galois::DistMemSys G;
  DistBenchStart(argc, argv, name, desc, url);
  const auto &net = galois::runtime::getSystemNetworkInterface();
  // MPI_INIT 得到每个host的第一个进程ID
  // 就是获取每个mpi进程所在的host名，然后排序取host名中最小的一个id启动mindspore进程
  char processor_name[MPI_MAX_PROCESSOR_NAME]; // MPI_MAX_PROCESSOR_NAME是MPI中定义的一个常量，表示处理器名字的最大长度
  int name_len;
  MPI_Get_processor_name(processor_name, &name_len); // 获取处理器名字,并将名字长度赋值给name_len，并行有进程和线程两个粒度，MPI_Get_processor_name是进程粒度的
  std::hash<std::string> h;
  unsigned int a = h(processor_name);
  unsigned int hasht[net.Num];                                                // hash存的是mpi进程所在的host的hostname  net.Num:The total number of machines in the current program
  MPI_Allgather(&a, 1, MPI_UNSIGNED, hasht, 1, MPI_UNSIGNED, MPI_COMM_WORLD); // MPI_Allgather的参数：发送缓冲区的首地址，发送缓冲区中的元素个数，发送数据的数据类型，接收缓冲区的首地址，接收缓冲区中的元素个数，接收数据的数据类型，通信域
  // MPI_Allgather的返回值
  std::vector<unsigned int> index; // index存的是每个host(可能存在多个mpi进程)的某一个mpi进程id
  unsigned int c = hasht[0];
  index.push_back(0);
  int i = 0;
  for (auto b : hasht)
  {
    if (c != b)
    {
      index.push_back(i); // index存的是每个host(可能存在多个mpi进程)的某一个mpi进程id,这个id对应的进程会开启mindspore
      c = b;
    }
    i++;
  }
  //   std::vector
  // if (net.ID == 0)
  // {
  //   // galois::runtime::reportParam(REGION_NAME, "Max Iterations", maxIterations);
  //   // galois::runtime::reportParam(REGION_NAME, "Source Node ID", startNode);
  // }
  if (std::find(index.begin(), index.end(), (unsigned int)(net.ID)) != index.end())
  {
    ls_flag = true;
  }
  else
  {
    ls_flag = false;
  }
  // initial mindspore,早点开始预留处理时间
  if (mindspore && ls_flag)
  // if (ls_flag)
  {
    
    t1=std::thread(threadFunction); // 创建一个线程，执行mindspore_thread函数
    t1.detach();                      // detach()函数的作用是，让线程在后台运行，不会阻塞主线程，主线程结束后，子线程也会结束
                                      //这里的主线程是指下面的while循环，子线程是指上面的mindspore_thread函数
                                      //这里采用了并行编程的思想，程序在某一个进程中开启一个mindspore线程，当这个进程结束时，mindspore线程会自动结束
    sleep(10);
  }

  galois::StatTimer StatTimer_total("TimerTotal", REGION_NAME);

  StatTimer_total.start();

  std::unique_ptr<Graph> hg;
#ifdef GALOIS_ENABLE_GPU
  std::tie(hg, syncSubstrate) =
      distGraphInitialization<NodeData, void>(&cuda_ctx);
#else
  std::tie(hg, syncSubstrate) = distGraphInitialization<NodeData, void>();
#endif
  // bitset comm setup
  bitset_dist_current.resize(hg->size());

  galois::gPrint("[", net.ID, "] InitializeGraph::go called\n");

  InitializeGraph::go((*hg));
  galois::runtime::getHostBarrier().wait();

  // accumulators for use in operators
  galois::DGAccumulator<uint64_t> DGAccumulator_sum;
  galois::DGReduceMax<uint32_t> m;
  // std::cout<<"ID: "<<net.ID << "   flag:"<<ls_flag<<std::endl;

  for (auto run = 0; run < numRuns; ++run)
  {

    // galois::gPrint("[", net.ID, "] BFS::go run ", run, " called\n");
    std::string timer_str("Timer_" + std::to_string(run));
    galois::StatTimer StatTimer_main(timer_str.c_str(), REGION_NAME);

    StatTimer_main.start();
    if (execution == Async)
    {
      BFS<true>::go(*hg);
    }
    else
    {
      BFS<false>::go(*hg);
    }
    StatTimer_main.stop();
    // sanity check
    BFSSanityCheck::go(*hg, DGAccumulator_sum, m);

    if ((run + 1) != numRuns)
    {
      if (personality == GPU_CUDA)
      {
#ifdef GALOIS_ENABLE_GPU
        bitset_dist_current_reset_cuda(cuda_ctx);
#else
        abort();
#endif
      }
      else
      {
        bitset_dist_current.reset();
      }
    }

    syncSubstrate->set_num_run(run + 1);
    InitializeGraph::go((*hg));
    galois::runtime::getHostBarrier().wait();
  }

  //   MPI_Bcast(&thread_ended, 1, MPI_CXX_BOOL,0,MPI_COMM_WORLD);
  StatTimer_total.stop();

  if (output)
  {
    std::vector<uint32_t> results = makeResults(hg);
    auto globalIDs = hg->getMasterGlobalIDs();
    assert(results.size() == globalIDs.size()); // 断言，如果不满足条件则终止程序

    writeOutput(outputLocation, "BFS_CPU_result_output.txt", results.data(), results.size(),
                globalIDs.data());
  }
  return 0;
}

void threadFunction()
{
    std::string command = "/home/zwt/.conda/envs/galois/bin/python /home/zwt/lhy/MyProject/DepGraph/MyProject/communication/test1/PY.py"; // 替换为你的Python脚本命令
    command+=" --input "+npu_input;
    command+=" --output "+npu_output;
    command+=" --edge_num "+std::to_string(npu_edge_num);
    command+=" --source_node "+std::to_string(startNode);
    FILE* pipe = popen(command.c_str(), "r");
    if (!pipe)
    {
        std::cerr << "Error executing Python script." << std::endl;
        return;
    }
    std::cout << "执行python完毕" << std::endl;

    char buffer[20];
    while (!feof(pipe))
    {
        if (fgets(buffer, 128, pipe) != nullptr)
        {
            // 解析Python程序的输出
            int vertexId;
            double vertexValue;
            sscanf(buffer, "%d [%lf]", &vertexId, &vertexValue);
            vertexMap[vertexId] = vertexValue;
        }
    }
    std::cout << "解析输出完毕" << std::endl;
    pclose(pipe);

    // 线程结束，通知主函数
    threadFinished = true;
    std::cout << "通知主函数" << std::endl;
}
