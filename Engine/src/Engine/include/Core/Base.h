#pragma once

#ifdef GE_PLATFORM_WINDOWS
#ifdef GE_BUILD_DLL
#define ENGINE_API __declspec(dllexport)
#else
#define ENGINE_API __declspec(dllimport)
#endif
#else
#error Engine only supports Windows
#endif

#ifdef GE_ENABLE_ASSERTS
#define GE_ASSERT(x, ...)                                   \
    {                                                       \
        if (!(x))                                           \
        {                                                   \
            GE_ERROR("Assertion Failed: {0}", __VA_ARGS__); \
            __debugbreak();                                 \
        }                                                   \
    }
#define GE_CORE_ASSERT(x, ...)                                   \
    {                                                            \
        if (!(x))                                                \
        {                                                        \
            GE_CORE_ERROR("Assertion Failed: {0}", __VA_ARGS__); \
            __debugbreak();                                      \
        }                                                        \
    }
#else
#define GE_ASSERT(x, ...)
#define GE_CORE_ASSERT(x, ...)
#endif

#define BIT(x) (1 << x)
