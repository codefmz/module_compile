# 模块化编译

## 背景

1. 不同机型需要使用不同的算法组合，比如 MachineA 需要依赖算法  add 与 sub 算法， MachineB 需要依赖算 mul 与 div， 希望根据实际所需要的算法进行编译，不包含不需要的算法。

## 实现

1. 配置机型所需要的算法 yaml 文件
2. 编译脚本传递所需要的机型给CMake 文件， CMake 中使用 command 执行 python 脚本解析yaml 文件，获取需要的算法

