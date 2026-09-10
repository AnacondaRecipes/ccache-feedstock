#!/bin/bash
mkdir build
cd build

if [ "$target_platform" = "osx-64" ]; then
    CXXFLAGS="${CXXFLAGS} -D_LIBCPP_DISABLE_AVAILABILITY"
fi

if [[ "$target_platform" == osx-* ]]; then
    # CMake's check_function_exists(getopt_long) is a link-only probe that
    # unreliably reports "not found" against Apple's libSystem, even though
    # getopt_long is present. Skip the broken probe.
    CMAKE_ARGS="${CMAKE_ARGS} -DHAVE_GETOPT_LONG=1"
fi

cmake \
    ${CMAKE_ARGS} \
    -DDEPS=LOCAL \
    -DENABLE_TESTING=ON \
    -DWARNINGS_AS_ERRORS=FALSE \
    -DENABLE_DOCUMENTATION=OFF \
    -GNinja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=${PREFIX} \
    ${SRC_DIR}

ninja
ninja install

cd unittest
./unittest