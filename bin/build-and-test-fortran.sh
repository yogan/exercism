#!/bin/sh
[ -d build ] || mkdir build
cd build || exit 1
cmake -G "Unix Makefiles" .. && make && ctest --output-on-failure
