cmake_minimum_required(VERSION 3.22)
# Library Name
project(Engine)

set_output_directories(DEBUG Debug)
set_output_directories(RELEASE Release)
set_output_directories(RELWITHDEBINFO RelWithDebInfo)
set_output_directories(MINSIZEREL MinSizeRel)

# System : Windows
if (NOT WIN32)

    message(FATAL_ERROR "This project is only supported on Windows.")

endif()

# Compile Library Once
if(NOT TARGET Engine)

    # Options : SHARED , STATIC
    set(PROJECT_TYPE SHARED)

    # Compiler : MSVC
    if (MSVC)

        set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS TRUE)
        # set(BUILD_SHARED_LIBS TRUE)

    endif()

    # Source Files
    set(SOURCE_FILES

        src/Engine/src/Core/Application.cpp
        src/Engine/src/Core/Log.cpp
        src/Engine/src/Platform/Windows/WindowsWindow.cpp

    )

    # Header Directories
    set(INCLUDE_DIRS

        src/Engine/include

    )

    # Dependency CMakeLists.txt Locations
    set(SUB_PROJECTS

        vendor/spdlog
        vendor/glfw

    )

    # Library Names
    set(LIB_NAMES

        spdlog
        glfw
        opengl32

    )

    # Compile Library
    message(STATUS "Compiling source files '${SOURCE_FILES}' in '${PROJECT_NAME}'")
    add_library(${PROJECT_NAME} ${PROJECT_TYPE} ${SOURCE_FILES})
    target_precompile_headers(${PROJECT_NAME} PRIVATE src/Engine/include/gepch.h)

    # Set Compile Flags
    if(WIN32)

        target_compile_definitions(${PROJECT_NAME} PRIVATE GE_PLATFORM_WINDOWS)

    endif()
    
    if(${PROJECT_TYPE} STREQUAL "SHARED")

        target_compile_definitions(${PROJECT_NAME} PRIVATE GE_BUILD_DLL)

    endif()

    # Enable Assertions
    target_compile_definitions(${PROJECT_NAME} PRIVATE GE_ENABLE_ASSERTS)

    # Include Directories
    message(STATUS "Including directories '${INCLUDE_DIRS}' in '${PROJECT_NAME}'")
    target_include_directories(${PROJECT_NAME} PUBLIC ${INCLUDE_DIRS})

    # Add Dependencies
    foreach(PROJECT IN LISTS SUB_PROJECTS)

        message(STATUS "Including subproject '${PROJECT}' in '${PROJECT_NAME}'")
        target_include_directories(${PROJECT_NAME} PRIVATE ${PROJECT})

        if(NOT TARGET ${PROJECT})

            message(STATUS "Adding subproject '${PROJECT}' to '${PROJECT_NAME}'")
            add_subdirectory(${PROJECT} ${PROJECT})

        endif()

    endforeach()

    # Link Libraries
    message(STATUS "Linking libraries '${LIB_NAMES}' to '${PROJECT_NAME}'")
    target_link_libraries(${PROJECT_NAME} ${LIB_NAMES})

    message(STATUS "Creating Project '${PROJECT_NAME}'")

endif()
