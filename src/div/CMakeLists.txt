file(GLOB SRC "src/*.cpp" "$src/*.h")
add_library(div OBJECT ${SRC})
target_include_directories(div PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/include/ DESTINATION include FILES_MATCHING PATTERN "*.h")