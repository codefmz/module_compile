cmake_minimum_required(VERSION 3.10)
project(OpencvStudy VERSION 1.0.0)

if (CMAKE_BUILD_TYPE MATCHES Debug)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O0 -g3")
else()
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O2")
endif()

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

message("machine : ${MACHINE}")
execute_process(
    COMMAND python3 ${PROJECT_SOURCE_DIR}/parse.py ${MACHINE} ${PROJECT_SOURCE_DIR}
    OUTPUT_VARIABLE ALGS
    OUTPUT_STRIP_TRAILING_WHITESPACE
)

set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)

message("algs : ${ALGS}")
set(ALG_OBJECTS "")
foreach(alg ${ALGS})
    message("alg = ${alg}")
    option(BUILD_${alg} "Build ${alg}..." ON)
    add_subdirectory(src/${alg})
    list(APPEND ALG_OBJECTS $<TARGET_OBJECTS:${alg}>)
endforeach()

add_library(alg SHARED ${ALG_OBJECTS})

add_executable(mc main.cpp)
target_link_libraries(mc alg)
target_include_directories(mc PUBLIC ${PROJECT_SOURCE_DIR}/install/include)