#!/bin/bash

#该脚本用来测试在同等规模(顶点数量相同)，不同稠密度的情况下，NPU端的性能与CPU端的性能对比

# 定义变量
origin_dateset_name="origin_dateset_15_16.edgelist" #原始数据集的名称，包含了顶点数量和平均度数，格式为txt，需要转化为gr格式
node_num=15 #顶点数量
edge_num=16 #平均度数
directory_name="dateset_15_16" #数据集的名称，包含了顶点数量和平均度数，格式为txt，需要转化为gr格式 
# # 第一步：生成数据集
/home/zwt/lhy/MyProject/DepGraph/MyProject/graph_generate/generator_omp ${node_num} -e ${edge_num} -o /home/zwt/lhy/MyProject/DepGraph/MyProject/graph_generate/output/${origin_dateset_name}
# 展示数据集文件大小
echo "顶点数量为：2^$node_num，平均度数为:$edge_num的数据集的大小为："
du -h /home/zwt/lhy/MyProject/DepGraph/MyProject/graph_generate/output/${origin_dateset_name}

# 第二步：数据集格式转化
mkdir -p /home/zwt/lhy/MyProject/DepGraph/MyProject/dataset/${directory_name}/CPU
mkdir -p /home/zwt/lhy/MyProject/DepGraph/MyProject/dataset/${directory_name}/NPU
mkdir -p /home/zwt/lhy/MyProject/DepGraph/MyProject/output/${directory_name}/
mkdir -p /home/zwt/lhy/MyProject/DepGraph/MyProject/output/${directory_name}/Mylog/
/home/zwt/lhy/MyProject/DepGraph/build/tools/graph-convert/graph-convert --edgelist2gr --edgeType=void /home/zwt/lhy/MyProject/DepGraph/MyProject/graph_generate/output/${origin_dateset_name} /home/zwt/lhy/MyProject/DepGraph/MyProject/dataset/${directory_name}/CPU/dataset.gr
#统计度数最大的顶点作为起始点
source_node=$(python /home/zwt/lhy/MyProject/DepGraph/MyProject/find_source_node/find_source_node.py --path=/home/zwt/lhy/MyProject/DepGraph/MyProject/graph_generate/output/${origin_dateset_name})

# 运行代码
# 执行CPU代码
GALOIS_DO_NOT_BIND_THREADS=1 /usr/bin/mpirun --allow-run-as-root -n 1 /home/zwt/lhy/MyProject/DepGraph/build/lonestar/analytics/distributed/bfs/bfs-push_copy-dist /home/zwt/lhy/MyProject/DepGraph/MyProject/dataset/${directory_name}/CPU/dataset.gr -t=1 -runs=1 -startNode=${source_node} -converge=false -exec=Async -mindspore=false -topN=1000 -output=true -outputLocation /home/zwt/lhy/MyProject/DepGraph/MyProject/output/${directory_name}/ 1>>/home/zwt/lhy/MyProject/DepGraph/MyProject/output/${directory_name}/Mylog/bfs_push_output.txt
# # 执行NPU代码
# cp -i /home/hedonghao/generate_graph/MyGenerateData/${dateset_name} /home/hedonghao/graph/dataset/${directory_name}/NPU/dataset.txt
# echo "wx1186405"|sudo chmod 777 "/home/hedonghao/graph/dataset/${directory_name}/NPU/dataset.txt"
# echo "wx1186405"|sudo python /home/hedonghao/graph/python_code/read_and_run.py --name=${directory_name} --source_node=${source_node} --node_num=${node_num} 1>>/home/hedonghao/graph/output/${directory_name}/Mylog/python_bfs_push.txt
# echo "wx1186405"|sudo chmod 777 -R /home/hedonghao/graph/output/${directory_name}/profiler/profiler/
