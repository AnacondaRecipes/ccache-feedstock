#!/bin/bash
mkdir build
cd build

if [ "$target_platform" = "osx-64" ]; then
    CXXFLAGS="${CXXFLAGS} -D_LIBCPP_DISABLE_AVAILABILITY"
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