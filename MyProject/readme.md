#graph_generate
作用是生成指定规模的数据集，一般采用txt格式
直接使用命令：
/home/zwt/lhy/MyProject/DepGraph/MyProject/graph_generate/generator_omp 16 -e 4 -o output/dataset.txt
将生成的txt数据集转化为gr数据集
/home/zwt/lhy/MyProject/DepGraph/build/tools/graph-convert/graph-convert --edgelist2gr /home/zwt/lhy/MyProject/DepGraph/MyProject/graph_generate/output/dataset.txt /home/zwt/lhy/MyProject/DepGraph/MyProject/dataset/dataset.gr
#dataset
存放数据集

