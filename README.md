# linq-MAC-Port
Macintosh port for linq project
linq is a macro programming language that does not only support the syntax optimization but also a stable and user firnedly framework
that would help the beginners to jump into the programming language easily. This language is in development phase and
it's alpha release is already ported for windows platform and tested against feasibility.

This language is developed on top of C++ and uses the MinGW compiler as the compilation engine. The purpose of this 
language is to make the syntax of C++ easy and user-friendly by providing lot of pre-built libraris as API and support
for Database Programming using light-weight SQLite. I implemented the SQLite C api into object oriented C++ api and then
use it as a wrapper for my macro language API. This approach makes it easier to develop database oriented programs
using C++ easily. You can use this language as a standalone language or as a C++ framework. My philosophy for developing
this framework was inspired by the JAVA programming language and Python programming language. There are Pre-build classes
for data types calles Number String and Decimal. Plus an additional Data Structure called Variant that can store anything.
The base type for all the classes being the Object class that makes it possible for flexible Inheritence and great Object
Oriented design of the framework.
