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
