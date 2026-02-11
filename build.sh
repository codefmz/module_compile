buildType="Release"
isNew=""
machine=""
target=""

printUsage() {
    echo "Usage:  [options]"
    echo "options:"
    echo "  -p      build machine type, eg: MachineA MachineB MachineC"
    echo "  -n      is new build"
    echo "  -d      debug or release"
    echo "  -t      target eg: alg mc"
}

#--name "$0": 用于在错误时打印出脚本信息
# -- "$@ 结束标志， 代表传入脚本的 所有参数，保留每个参数的边界
ARGS=$(getopt -o t:p:nd --name "$0" -- "$@")
if [ $? != 0 ]; then
    echo "Error: Invalid arguments"
    printUsage
    exit 1
fi

eval set -- "$ARGS"
while true; do
    case "$1" in
        -p)
            machine="$2"
            shift 2
            ;;
        -t)
            target="$2"
            shift 2
            ;;
        -n)
            isNew="y"
            shift
            ;;
        -d)
            buildType="Debug"
            shift
            ;;
        --)
            shift
            break
            ;;
    esac
done

if [ "$isNew" = "y" ]; then
    rm -rf build
fi

cmake  -S . -B build -DCMAKE_BUILD_TYPE="$buildType" -DMACHINE="$machine" -DCMAKE_INSTALL_PREFIX=install
cmake --build build --target $target
if [ "$target" != "alg" ]; then
    cmake --install build
fi

