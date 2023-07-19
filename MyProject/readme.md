#graph_generate
作用是生成指定规模的数据集，一般采用txt格式
直接使用命令：
/home/zwt/lhy/MyProject/DepGraph/MyProject/graph_generate/generator_omp 16 -e 4 -o /home/zwt/lhy/MyProject/DepGraph/MyProject/output/dataset.txt
将生成的txt数据集转化为gr数据集
/home/zwt/lhy/MyProject/DepGraph/build/tools/graph-convert/graph-convert --edgelist2gr /home/zwt/lhy/MyProject/DepGraph/MyProject/graph_generate/output/dataset.txt /home/zwt/lhy/MyProject/DepGraph/MyProject/dataset/dataset.gr
#dataset
存放数据集
#communication
执行npu代码，同时通过管道通信
#script
存放脚本
#graph_reorder
读取原始图数据集，统计度数最高的点作为起始点，区分稠密子图和普通图。
之前版本，生成稠密子图是选取稠密边(边上的两个顶点都属于稠密点)，现在为了使npu处理逻辑更完善，把起始边(以起始点为起点的边)也加入了稠密子图(为了避免稠密子图因此太过稀疏，要限制增加的起始边的数目)



