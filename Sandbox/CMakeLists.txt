cmake_minimum_required(VERSION 3.22)
project(Sandbox)

set_output_directories(DEBUG Debug)
set_output_directories(RELEASE Release)
set_output_directories(RELWITHDEBINFO RelWithDebInfo)
set_output_directories(MINSIZEREL MinSizeRel)

set(ENGINE_DIR ../Engine/)

# Source Files
set(SOURCE_FILES

    src/Sandbox.cpp

)

# Header Directories
set(INCLUDE_DIRS



)

# Dependency CMakeLists.txt Locations
set(SUB_PROJECTS

   ${ENGINE_DIR}

)

# Library Names
set(LIB_NAMES

    Engine

)

# Compile Project
message(STATUS "Compiling source files '${SOURCE_FILES}' in '${PROJECT_NAME}'")
add_executable(${PROJECT_NAME} ${SOURCE_FILES})

# Set Compile Flags
if(WIN32)

    target_compile_definitions(${PROJECT_NAME} PRIVATE GE_PLATFORM_WINDOWS)

endif()

# Include Directories
message(STATUS "Including directories '${INCLUDE_DIRS}' in '${PROJECT_NAME}'")
target_include_directories(${PROJECT_NAME} PRIVATE ${INCLUDE_DIRS})

# Add Dependencies
foreach(PROJECT IN LISTS SUB_PROJECTS)

    message(STATUS "Including subproject '${PROJECT}' in '${PROJECT_NAME}'")
    target_include_directories(${PROJECT_NAME} PRIVATE ${PROJECT})

    if(NOT TARGET ${PROJECT})

        message(STATUS "Adding subproject '${PROJECT}' to '${PROJECT_NAME}'")
        add_subdirectory(${PROJECT} ${PROJECT_NAME})

    endif()

endforeach()

# Link Libraries
message(STATUS "Linking libraries '${LIB_NAMES}' to '${PROJECT_NAME}'")
target_link_libraries(${PROJECT_NAME} ${LIB_NAMES})

message(STATUS "Creating Project '${PROJECT_NAME}'")

# Copy Engine Library to Output Directory
add_custom_command(
    TARGET ${PROJECT_NAME}
    POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_if_different
            "$<TARGET_FILE:Engine>"
            "$<TARGET_FILE_DIR:${PROJECT_NAME}>"
    COMMENT "Copying Engine library to '${PROJECT_NAME}'"
)
