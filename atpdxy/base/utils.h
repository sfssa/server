#pragma once

#include <vector>
#include <unistd.h>
#include <sys/syscall.h>
#include <string>
#include <execinfo.h>
#include <iostream>
#include <sstream>

namespace atpdxy{

// 获取线程id
pid_t GetThreadId();
// 获取当前栈信息：bt-保存调用栈；size-最多返回层数；skip-栈的跳过层数
void Backtrace(std::vector<std::string>& bt, int size = 64, int skip = 1);
// 获取栈信息字符串：size-栈的最大层数；skip-栈的跳过层数；prifix-栈信息前输出的内容
std::string BacktraceToString(int size = 64, int skip = 2, const std::string& prefix = "");

}
