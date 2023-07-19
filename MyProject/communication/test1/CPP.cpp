#include <iostream>
#include <string>
#include <thread>
#include <mutex>
#include <condition_variable>
#include <cstdio>
#include <map>

// 互斥锁和条件变量用于线程同步
std::mutex mtx;
std::condition_variable cv;
bool threadFinished = false;
std::string result;
std::map<int, double> vertexMap;

// t1线程函数
void threadFunction()
{
    std::string command = "python /home/zwt/lhy/MyProject/DepGraph/MyProject/communication/test1/PY.py"; // 替换为你的Python脚本命令
    FILE* pipe = popen(command.c_str(), "r");
    if (!pipe)
    {
        std::cerr << "Error executing Python script." << std::endl;
        return;
    }


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

    pclose(pipe);

    // 线程结束，通知主函数
    std::unique_lock<std::mutex> lock(mtx);
    threadFinished = true;
    lock.unlock();
    cv.notify_one();
}

int main()
{
    // 开启t1线程
    std::thread t1(threadFunction);

    // 进入主函数的死循环
    while (true)
    {
        std::unique_lock<std::mutex> lock(mtx);
        if (cv.wait_for(lock, std::chrono::milliseconds(100)) == std::cv_status::timeout)
        {
            // 线程未结束，继续等待
            continue;
        }


        // 线程已结束，打印计算结果并退出循环
        std::cout << "顶点信息：" << std::endl;
        for (const auto& vertex : vertexMap)
        {
            std::cout << "顶点ID: " << vertex.first << ", 值: " << vertex.second << std::endl;
        }
        break;
    }

    // 等待t1线程结束
    t1.join();

    return 0;
}
