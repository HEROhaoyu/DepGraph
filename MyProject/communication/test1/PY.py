# encoding: utf-8
import numpy as np
import time
import argparse
import mindspore
from mindspore import Tensor
from mindspore import numpy
from mindspore import dtype as mstype
import mindspore.ops as ops
from mindspore import Profiler
def read_argument():
    parser = argparse.ArgumentParser()
    parser.add_argument('--input', type=str, default = None)
    parser.add_argument('--output', type=str, default = None)
    parser.add_argument('--source_node', type=str, default = None)
    parser.add_argument('--edge_num', type=str, default = None)
    input=parser.parse_args().input
    output=parser.parse_args().output
    source_node=int(parser.parse_args().source_node)
    edge_num=int(parser.parse_args().edge_num)
    return input,output,source_node,edge_num

def read_graph(filename,edge_num):
    #print("执行mind_graph.py代码，生成图数据")
    # t1 = time.time()#统计程序耗时
    vertices_orginal = set()
    id_map={}
    edges_reorder = []
    read_edge_num=0
    with open(filename, 'r') as file:
        for line in file:
            start, end = map(int, line.strip().split())
            vertices_orginal.add(start)
            vertices_orginal.add(end)
            if start not in id_map:
                id_map[start]=len(id_map)
            if end not in id_map:
                id_map[end]=len(id_map)
            start=id_map[start]
            end=id_map[end]
            edges_reorder.append((start, end))
            read_edge_num+=1
            if(read_edge_num==edge_num):
                break
    # t2 = time.time()
    #print("read graph finished in time:",t2-t1)
    return vertices_orginal,edges_reorder,id_map


def BFSMatmul(x,y):
    add = ops.Add() 
    sum = add(x, y)                
    op = ops.ReduceMin(keep_dims=True)        
    output = op(sum,0)
    return output

def process_graph(vertices_orginal,edges_reorder,source_node,edge_num):
    #print("执行Matrix_BFS.py代码，使用mindspore进行计算")
    vertex_num=len(vertices_orginal)
    matrix = np.ones(shape=(vertex_num,vertex_num))*2000
    for edge in edges_reorder:
        matrix[edge[0]][edge[1]] = 1
    for i in range(vertex_num):
        matrix[i][i]=0
    matrix = Tensor(matrix,mstype.float16)
    V = np.ones([vertex_num,vertex_num], dtype=np.int16) * 100#np.ones用于生成单位阵
    V[source_node] = 0#暂时人工指定source_node
    V = Tensor(V,mstype.int16)
    finished = False
    itr = 0
    # t1 = time.time()
    while(not finished):
        res = BFSMatmul(matrix, V)
        transpose = ops.Transpose()
        V1 = transpose(res,(1,0))
        finished = numpy.array_equal(V,V1)
        if finished == False:
            V = V1
        #print("itr",itr,"finished")
        itr=itr+1
    # t2 = time.time()
    V = V.asnumpy()
    #print("BFS finished in:",t2-t1)
    return V
def write_BFS_to_pipe(BFS_value,vertices_orginal,id_map):
    # 将字典数据序列化为字符串
    # result=[f"{v} {BFS_value[id_map[v]]}\n" for v in vertices_orginal]
    # result_str=' '.join(result)
    # print(result_str)
    for v in vertices_orginal:
        print(v,BFS_value[id_map[v]])

if __name__ == "__main__":
    #读取参数
    input,output,source_node,edge_num=read_argument()
    
    #开启Profiler
    # mindspore.set_context(mode=mindspore.GRAPH_MODE, device_target="Ascend")
    # profiler = Profiler(output_path="/home/hedonghao/graph/output/"+directory_name+"/profiler",profile_memory=True,aicore_metrics=1,l2_cache=True)#初始化分析器
    
    #读图
    vertices_orginal,edges_reorder,id_map=read_graph(input,edge_num)
    source_node=id_map[source_node]
    
    # 处理图
    BFS_value=process_graph(vertices_orginal,edges_reorder,source_node,edge_num)
    
    #传递数据
    write_BFS_to_pipe(BFS_value,vertices_orginal,id_map)

    # profiler.analyse()#关闭分析器