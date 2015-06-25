#!/bin/bash

clear
echo "Generating the dylib files for the implementations..."

echo "compiling _NativeFrameworkDSIMPL.cpp and generating libfrmwrklinqds.dylib"
g++ -w -std=c++14 implementations/_NativeFrameworkDSIMPL.cpp -shared -olibs/libfrmwrklinqds.dylib
echo "Copying linq data structure library to the test module"
cp libs/libfrmwrklinqds.dylib $HOME/Desktop/testing_module/linq\ Mac\ Port\ Testing/libs/

echo "compiling _NativeFrameworkConverterIMPL.cpp and generating libfrmwrklinqconverter.dylib"
g++ -w -std=c++14 implementations/_NativeFrameworkConverterIMPL.cpp -shared -olibs/libfrmwrklinqconverter.dylib
echo "Copying linq converter library to the test module"
cp libs/libfrmwrklinqconverter.dylib $HOME/Desktop/testing_module/linq\ Mac\ Port\ Testing/libs/

echo "compiling _NativeFrameworkMathsIMPL.cpp and generating libframeworkmaths.dylib"
g++ -w -std=c++14 implementations/_NativeFrameworkMathsIMPL.cpp -shared -olibs/libfrmwrklinqmaths.dylib
echo "Copying linq maths library to the test module"
cp libs/libfrmwrklinqmaths.dylib $HOME/Desktop/testing_module/linq\ Mac\ Port\ Testing/libs/


echo "Done Compiling.. scroll up to see errors"
