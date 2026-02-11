file(GLOB SRC "src/*.cpp")
add_library(sub STATIC ${SRC})
target_include_directories(sub PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/include/ DESTINATION include FILES_MATCHING PATTERN "*.h")