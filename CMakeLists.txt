# cmake最小版本需求3.0
cmake_minimum_required(VERSION 3.0)
# 项目名称
project(server)
# 包含设置cmake编译的代码文件
# include (cmake/utils.cmake)
# 启动makefile详细输出
set(CMAKE_VERBOSE_MAKEFILE ON)
# $ENV{CSSFLAGS}：从环境变量中获取额外的编译选项；-rdynamic：将所有符号都添加到动态链接符号表中；
# -O3：启用高级优化级别；-g：生成调试信息；-std=c++11：使用c++11标准；-Wall：启用常见的警告信息；
# -Wno-deprecated：禁止对使用了被标记已启用的特性的代码产生警告；-Werror：将所有警告视为错误；
# -Wno-unused-function：禁止对未使用的函数产生警告；-Wno-builtin-macro-redefined：禁止对宏被重定义的警告
set(CMAKE_CXX_FLAGS "$ENV{CXXFLAGS} -rdynamic -O3 -g -std=c++11 -Wall -Wno-deprecated -Werror -Wno-unused-function -Wno-builtin-macro-redefined")
# 将一组源文件编译成一个共享库
# LIB_SRC包含的源文件
set(LIB_SRC
    atpdxy/base/fileappender.cpp
    atpdxy/base/utils.cpp
    atpdxy/base/mutex.cpp
    atpdxy/base/countdownlatch.cpp)
# 一个由LIB_SRC中包含的源文件生成的名字为atpdxy的共享库
add_library(atpdxy SHARED ${LIB_SRC})
# 定义了一个变量LIBS，包含了需要链接到项目中的库的名称
set(LIBS
    atpdxy
    pthread)

# 输出一条消息到CMake构建系统的输出中，${LIBS}表示输出LIBS变量的值，也就是链接库的名称
message("***" ${LIBS})

# 添加可执行文件
add_executable(test_fileappender tests/test_fileAppender.cpp)
# 添加依赖关系，在构建test_appender前先构建atpdxy
add_dependencies(test_fileappender atpdxy)
# 指定链接到test_appender可执行文件中的库
target_link_libraries(test_fileappender ${LIBS})
# 设置可执行文件和库的输出路径

add_executable(test_mutex tests/test_mutex.cpp)
add_dependencies(test_mutex atpdxy)
target_link_libraries(test_mutex ${LIBS})

add_executable(test_util tests/test_util.cpp)
add_dependencies(test_util atpdxy)
target_link_libraries(test_util ${LIBS})

add_executable(test_countdownlatch tests/test_countdownlatch.cpp)
add_dependencies(test_countdownlatch atpdxy)
target_link_libraries(test_countdownlatch ${LIBS})

set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)
set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib)

