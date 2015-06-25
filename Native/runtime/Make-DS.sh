#!/bin/bash

echo "Generating the dylib file for the Data Structure implementation"

g++ -w -std=c++14 implementations/_NativeFrameworkDSIMPL.cpp -shared -olibs/libfrmwrklinqds.dylib
echo "Copying Data Structure library to the test module"
cp libs/libfrmwrklinqds.dylib $HOME/Desktop/testing_module/linq\ Mac\ Port\ Testing/libs/

echo "Done compiling the data structure implementation"