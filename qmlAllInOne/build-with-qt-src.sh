#!/bin/bash
set -e
rm -rf build
mkdir build
cd build
cmake -S .. -DCMAKE_PREFIX_PATH=/opt/qt-6.8-x64 -DCMAKE_BUILD_TYPE=Release
cmake --build . --parallel
