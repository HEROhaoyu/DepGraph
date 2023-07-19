import argparse
parser = argparse.ArgumentParser()
parser.add_argument('--path', type=str, default = None)
filename=parser.parse_args().path

def find_most_common_number(filename):
    counter = {}

    # 读取文件并提取数字
    with open(filename, 'r') as file:
        for line in file:
            line = line.strip()
            if line:
                num = int(line.split()[0])
                counter[num] = counter.get(num, 0) + 1

    # 找出出现次数最多的数字
    max_count = max(counter.values())
    most_common_numbers = [num for num, count in counter.items() if count == max_count]

    return most_common_numbers[0] if most_common_numbers else None

# 使用示例

most_common = find_most_common_number(filename)
if most_common is not None:
    print(most_common)
else:
    print("文件为空或没有有效的数字行.")