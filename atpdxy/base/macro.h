#pragma once

#include <string.h>
#include <assert.h>
#include "./utils.h"

// 注意：在写宏的时候不要管在\后面加空格！！！

// 宏的封装，告诉编译器条件大概率成立和条件大概率不成立
#if defined __GNUC__ || defined __llvm__
#   define  ATPDXY_LIKELY(x)    __builtin_expect(!!(x), 1)
#   define  ATPDXY_UNLIKELY(x)  __builtin_expect(!!(x), 0)
#else
#   define  ATPDXY_LIKELY(x)    (x)
#   define  ATPDXY_UNLIKELY(x)  (x)
#endif

// 断言宏封装
#define ATPDXY_ASSERT(x) \
    if(ATPDXY_UNLIKELY(!(x))){ \
        std::cout << "ASSERTION: " #x \
            << "\nbacktrace:\n" \
            << atpdxy::BacktraceToString(100, 2, "    "); \
        assert(x); \
    }

#define ATPDXY_ASSERT2(x, w) \
    if(ATPDXY_UNLIKELY(!(x))){ \
        std::cout << "ASSERTION: " #x \
            << "\n" << w \
            << "\nbacktrace:\n" \
            << atpdxy::BacktraceToString(100, 2, "    "); \
        assert(x); \
    }
