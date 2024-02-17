#!/bin/sh
mkdir -p build
cd build || exit 1
cmake -G "Unix Makefiles" ..
make
