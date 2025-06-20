mkdir build
cd build

cmake -GNinja ^
    %CMAKE_ARGS% ^
    %SRC_DIR% ^
    -DDEPS=LOCAL ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DENABLE_TESTING=ON ^
    -DENABLE_DOCUMENTATION=OFF ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX%

ninja
ninja install

cd unittest
.\unittest