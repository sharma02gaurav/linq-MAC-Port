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

echo "compiling _NativeFrameworkConsoleIMPL.cpp and generating libframeworkconsole.dylib"
g++ -w -std=c++14 implementations/_NativeFrameworkConsoleIMPL.cpp -shared -olibs/libfrmwrklinqconsole.dylib
echo "Copying linq console library to the test module"
cp libs/libfrmwrklinqconsole.dylib $HOME/Desktop/testing_module/linq\ Mac\ Port\ Testing/libs/

echo "compiling _NativeFrameworkDateIMPL.cpp and generating libframeworkdate.dylib"
g++ -w -std=c++14 implementations/_NativeFrameworkDateIMPL.cpp -shared -olibs/libfrmwrklinqdate.dylib
echo "Copying linq console library to the test module"
cp libs/libfrmwrklinqdate.dylib $HOME/Desktop/testing_module/linq\ Mac\ Port\ Testing/libs/

echo "compiling _NativeFrameworkStreamsIMPL.cpp and generating libframeworkstreams.dylib"
g++ -w -std=c++14 implementations/_NativeFrameworkStreamsIMPL.cpp -shared -olibs/libfrmwrklinqstreams.dylib
echo "Copying linq streams library to the test module"
cp libs/libfrmwrklinqstreams.dylib $HOME/Desktop/testing_module/linq\ Mac\ Port\ Testing/libs/

echo "compiling _NativeFrameworkSQLiteIMPL.cpp and generating libframeworksqlite.dylib"
g++ -w -std=c++14 implementations/_NativeFrameworkSQLiteIMPL.cpp -shared -olibs/libfrmwrklinqsqlite.dylib -Llibs -lfrmwrklinqds -lsqlite
echo "Copying linq sqlite library to the test module"
cp libs/libfrmwrklinqsqlite.dylib $HOME/Desktop/testing_module/linq\ Mac\ Port\ Testing/libs/

echo "compiling _NativeFrameworkSystemIMPL.cpp and generating libframeworksystem.dylib"
g++ -w -std=c++14 implementations/_NativeFrameworkSystemIMPL.cpp -shared -olibs/libfrmwrklinqsystem.dylib
echo "Copying linq system library to the test module"
cp libs/libfrmwrklinqsystem.dylib $HOME/Desktop/testing_module/linq\ Mac\ Port\ Testing/libs/

echo "Done Compiling.. scroll up to see errors"
