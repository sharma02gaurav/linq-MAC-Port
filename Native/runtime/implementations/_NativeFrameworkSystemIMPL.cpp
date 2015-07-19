#ifndef NATIVE_FRAMEWORK_SYSTEMIMPL
#define NATIVE_FRAMEWORK_SYSTEMIMPL

#include "../includes/_NativeFrameworkSystem.h"

/**
*	Ported for Max OSX
*
*	To Be Ported
*	
*	deprecating the system info class as it's application is very rare
*	and keeping only the Environment Variable manipulator classes in this implementation
*
*	@author gaurav
*/

#ifndef EXCEPTION_DEFS
	#define EXCEPTION_DEFS
	
	#define __ERRFILE __FILE__
	#define __ERRFUNC __func__
	#define __ERRLINE __LINE__
#endif

#define _SystemException(ERROR_MESSAGE) _NativeFrameworkSystemException(ERROR_MESSAGE, __ERRFILE, __ERRFUNC, __ERRLINE);


/*
*	EXCEPTION CLASS IMPLEMENTATION
*/

void _NativeFrameworkSystemException::_printError(){
	cerr << "ERROR: " ;
	cerr << errorMessage << " \nin " << filename << " on line " << line << " in function " << function << endl;
	cerr << "Aborting" << endl;
}
_NativeFrameworkSystemException::_NativeFrameworkSystemException(string errorMessage,
	string filename,
	string function,
	int line){

	this -> errorMessage = errorMessage;
	this -> filename = filename;
	this -> function = function;
	this -> line = line;

	_printError();
}

string _NativeFrameworkSystemException::toString(){
	return errorMessage;
}

/*
*	SystemProperties Class IMPLEMENTATION
*/

string _NativeFrameworkSystemProperties::getFileSeparator(){
	return
		#ifdef _WIN32
			"\\";
		#else
			"//";
		#endif
}
string _NativeFrameworkSystemProperties::getPathSeparator(){
	return
		#ifdef _WIN32
			";";
		#else
			":";
		#endif
}
string _NativeFrameworkSystemProperties::getHomePath(){
	#ifdef _WIN32
		string baseDir = getenv("HOMEDRIVE");
		string homePath = baseDir + getFileSeparator() + string(getenv("HOMEPATH"));

		return homePath;
	#else
		return string(getenv("HOME"));
	#endif
}
string _NativeFrameworkSystemProperties::getBaseDirectoryPath(){
	#ifdef _WIN32
		return string(getenv("HOMEDRIVE"));
	#else
		return string("/");
	#endif
}

/*
*	WindowsSystemVariable Class Implementation
*/

bool _NativeFrameworkWindowsSystemVariable::containsVariable(string variableName){
	char *varValue = nullptr;
	varValue = getenv(variableName.c_str());
	return (varValue == nullptr) ? false : true;
}
string _NativeFrameworkWindowsSystemVariable::getValueOf(string variableName){
	if(_NativeFrameworkWindowsSystemVariable::containsVariable(variableName))
		return string(getenv(variableName.c_str()));
	return string("");
}
void _NativeFrameworkWindowsSystemVariable::createTempVariable(string variableName, string variableValue){
	string systemCommand = "\nSET " + variableName + string("=") + variableValue;
	
	// execute the system commmand to execute command
	system(systemCommand.c_str());	// this command will create a temporary variable
}
void _NativeFrameworkWindowsSystemVariable::updateTempVariable(string variableName, string variableValue){
	if(_NativeFrameworkWindowsSystemVariable::containsVariable(variableName)){
		
		string previousValue = _NativeFrameworkWindowsSystemVariable::getValueOf(variableName);
		string pathSeparator = _NativeFrameworkSystemProperties::getPathSeparator();
		string updateValue = previousValue + pathSeparator + variableValue;

		
		_NativeFrameworkWindowsSystemVariable::createTempVariable(variableName, updateValue);
	
	}else
		_NativeFrameworkWindowsSystemVariable::createTempVariable(variableName, variableValue);
}

void _NativeFrameworkWindowsSystemVariable::createSystemVariable(string variableName, string variableValue){
	string systemCommand = "\nSETX " + variableName + string(" ") +variableValue;

	//execute the system command 
	system(systemCommand.c_str());

	if(!_NativeFrameworkWindowsSystemVariable::containsVariable(variableName)){
		string msg = "Cannot create an environment variable with following values:\nName:\t"+ variableName +"\nValue:\t"+ variableValue;
		
		throw _SystemException(msg);
	}
}

void _NativeFrameworkWindowsSystemVariable::updateSystemVariable(string variableName, string variableValue){
	if(_NativeFrameworkWindowsSystemVariable::containsVariable(variableName)){
		
		string previousValue = _NativeFrameworkWindowsSystemVariable::getValueOf(variableName);
		string pathSeparator = _NativeFrameworkSystemProperties::getPathSeparator();
		string updateValue = previousValue + pathSeparator + variableValue;

		
		_NativeFrameworkWindowsSystemVariable::createSystemVariable(variableName, updateValue);
	
	}else
		_NativeFrameworkWindowsSystemVariable::createTempVariable(variableName, variableValue);
}

/*
*	WindowsProperties Class Implementation
*	/*
*	DEPRECATED IN MAC OSX PORT
*	Rason for Deprecation -> class found impratical
*	(Will be eliminated in next version of windows port as well)
*/

#endif