import numpy as np
import argparse


def read_argparse():
    parser = argparse.ArgumentParser()
    parser.add_argument('--input', type=str, default = None)
    parser.add_argument('--output', type=str, default = None)
    input=parser.parse_args().input
    output=parser.parse_args().output
    return input,output

def read_graph_data(file_path):
    """
    读取图数据文件并返回边的列表
    """
    # edges = np.loadtxt(file_path,int) #这一段话就可以实现读入图数据
    
    # 载入数据，每行数据表示一条边，两个数字分别表示边的两个顶点，如果每行有超出两个数字，则只取前两个数字
    edges = []
    degrees={}
    with open(file_path, "r") as f:
        for line in f.readlines():
            # edge = line.strip().split(',')#如果数据文件中的数据是用逗号分隔的，则用这行代码
            edge = line.strip().split()
            edges.append((int(edge[0]), int(edge[1])))
            if(int(edge[0]) in degrees):
                degrees[int(edge[0])]+=1
            else:
                degrees[int(edge[0])]=1
            if(int(edge[1]) in degrees):
                degrees[int(edge[1])]+=1
            else:
                degrees[int(edge[1])]=1

    return edges,degrees

def analyse_degrees(degrees):
    """
    统计度数最大的顶点的ID和度数
    """
    max_degree = 0
    max_degree_vertex = None

    for vertex, degree in degrees.items():
        if degree > max_degree:
            max_degree = degree
            max_degree_vertex = vertex

    return max_degree_vertex, max_degree



def find_best_threshold(max_degree, edges, degrees, coarse_ratio=0.1, medium_ratio=0.01, fine_ratio=0.001):
    """
    根据粗粒度、中粒度和细粒度搜索的比例找到数据集的最佳阈值

    参数：
    - max_degree: 最大的(出)度数
    - edges: 边的列表
    - degrees: 度数字典，记录每个点的度数
    - coarse_ratio: 粗粒度搜索的比例，相对于度数最大值的比例
    - medium_ratio: 中粒度搜索的比例，相对于粗粒度搜索的阈值区间的比例
    - fine_ratio: 细粒度搜索的比例，相对于中粒度搜索的阈值区间的比例

    返回值：
    - best_fine_threshold: 最佳阈值
    - max_fine_avg_degree: 稠密子图的平均度数
    - dense_edges_num: 稠密子图的边的数量
    - dense_vertex_set: 稠密子图的顶点数量
    """
    # 粗粒度搜索
    coarse_threshold_range = coarse_ratio * max_degree#粗粒度搜索的阈值区间,[0,coarse_threshold_range]
    coarse_thresholds = set(np.arange(0, max_degree, coarse_threshold_range))#np.arange(0, max_degree, coarse_threshold_range)返回一个数组，数组中的元素为0,coarse_threshold_range,2*coarse_threshold_range,...,max_degree
    best_coarse_threshold = None
    max_coarse_avg_degree = 0

    for threshold in coarse_thresholds:
        edge_num = 0
        vertex_set = set()

        for edge in edges:
            if degrees[edge[0]] > threshold and degrees[edge[1]] > threshold:
                vertex_set.add(edge[0])
                vertex_set.add(edge[1])
                edge_num += 1
        if(len(vertex_set)>40000):#阈值越高，点的数量越少，当点的数量小于40000时，我们认为此时的阈值不是很合适，因此跳过
            best_coarse_threshold=threshold
            continue
        
        if len(vertex_set) > 0:
            avg_degree = edge_num / len(vertex_set)
            if avg_degree > max_coarse_avg_degree:
                max_coarse_avg_degree = avg_degree
                best_coarse_threshold = threshold

    # 中粒度搜索
    medium_threshold_range = medium_ratio * coarse_threshold_range#中粒度搜索的阈值区间,[best_coarse_threshold - medium_threshold_range, best_coarse_threshold + medium_threshold_range]
    medium_thresholds = np.arange(best_coarse_threshold - medium_threshold_range, best_coarse_threshold + medium_threshold_range, medium_threshold_range)
    best_medium_threshold = None
    max_medium_avg_degree = 0

    for threshold in medium_thresholds:
        edge_num = 0
        vertex_set = set()

        for edge in edges:
            if degrees[edge[0]] > threshold and degrees[edge[1]] > threshold:
                vertex_set.add(edge[0])
                vertex_set.add(edge[1])
                edge_num += 1
        if(len(vertex_set)>40000):#阈值越高，点的数量越少，当点的数量小于40000时，我们认为此时的阈值不是很合适，因此跳过
            best_medium_threshold=threshold
            continue
        if len(vertex_set) > 0:
            avg_degree = edge_num / len(vertex_set)
            if avg_degree > max_medium_avg_degree:
                max_medium_avg_degree = avg_degree
                best_medium_threshold = threshold

    # 细粒度搜索
    fine_threshold_range = fine_ratio * medium_threshold_range
    fine_thresholds = np.arange(best_medium_threshold - fine_threshold_range, best_medium_threshold + fine_threshold_range, fine_threshold_range)
    best_fine_threshold = None
    max_fine_avg_degree = 0
    for threshold in fine_thresholds:
        edge_num = 0
        vertex_set = set()

        for edge in edges:
            if degrees[edge[0]] > threshold and degrees[edge[1]] > threshold:
                vertex_set.add(edge[0])
                vertex_set.add(edge[1])
                edge_num += 1
        if(len(vertex_set)>40000):#阈值越高，点的数量越少，当点的数量小于40000时，我们认为此时的阈值不是很合适，因此跳过
            best_fine_threshold=threshold
            continue
        if len(vertex_set) > 0:
            avg_degree = edge_num / len(vertex_set)
            if avg_degree > max_fine_avg_degree:
                max_fine_avg_degree = avg_degree
                best_fine_threshold = threshold
                

    # 返回结果
    return best_fine_threshold

def generate_edgelist_txt(edges,best_fine_threshold,source_node,output_path):
    sparse_edgelist=[]
    source_node_edgelist=[]
    with open(output_path,"w") as f:
        for edge in edges:
            if(edge[0]==source_node):
                source_node_edgelist.append(edge)
            elif(edge[0]<best_fine_threshold or edge[1]<best_fine_threshold):
                sparse_edgelist.append(edge)
            else:
                f.write(f"{edge[0]} {edge[1]}\n")
        for edge in source_node_edgelist:
            f.write(f"{edge[0]} {edge[1]}\n")
        for edge in sparse_edgelist:
            f.write(f"{edge[0]} {edge[1]}\n")
    f.close()
    #确定稠密子图的边数
    source_node_edge_num=len(source_node_edgelist)
    dense_edge_num=len(edges)-len(sparse_edgelist)-source_node_edge_num
    add_edge_num_threadhold=dense_edge_num*0.3
    if(source_node_edge_num<add_edge_num_threadhold):
        subgraph_edge_num=dense_edge_num+source_node_edge_num
    else:
        subgraph_edge_num=dense_edge_num+add_edge_num_threadhold
    return subgraph_edge_num
    

    
if __name__ == "__main__":
    # 读取参数
    # input_path=r"/home/zwt/lhy/MyProject/DepGraph/MyProject/dataset/Wiki-Vote.txt"#社交网络
    # output_path=r"/home/zwt/lhy/MyProject/DepGraph/MyProject/dataset/Wiki-Vote_reorder_graph.txt" 
    # dateset_name="Wiki-Vote社交网络"
    input,output=read_argparse()
    
    # 读取图数据文件
    edges,degrees = read_graph_data(input)
    
    # 找出最大度数以及它的ID
    max_degree_vertex, max_degree= analyse_degrees(degrees)
    source_node=max_degree_vertex

    # 找到最佳阈值
    best_fine_threshold = find_best_threshold(max_degree, edges, degrees)
    
    #生成重排序边文件
    subgraph_edge_num=generate_edgelist_txt(edges,best_fine_threshold,source_node,output)
    
    #打印全部结果
    # print("数据集名称：",dateset_name)
    # print("起始节点：",source_node)
    # print("最佳阈值：",best_fine_threshold)
    # print("最佳阈值的平均度数：",max_fine_avg_degree)
    # print("最佳阈值的边的数量：",best_fine_threshold_edge_num)
    # print("最佳阈值的顶点的数量：",best_fine_threshold_vertex_num)
    # print("稠密子图(包含起始边)的边数量：",subgraph_edge_num)
    
    print(source_node,subgraph_edge_num) #打印稠密子图的边数，传递参数给脚本

    