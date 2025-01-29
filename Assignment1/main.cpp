//****************************************************************************************************************************
//Program name: "Assignment, The Hello World Program". This program demonstrates user input and output                       *
//Copyright (C) 2024  Christine Mier                                                                                         *
//This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
//version 3 as published by the Free Software Foundation.                                                                    *
//This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         *
//warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
//A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.                           *
//****************************************************************************************************************************




//=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3=========4=========5=========6=========7**
//Author information
//  Author name: Christine Mier
//  Author email: cmier@csu.fullerton.edu
//
//Program information
//  Program name: Assignment 1, The Hello World Program
//  Programming languages X86 with one module in C++
//  Date development of version 1 began 2024-Aug-28
//  Date development of version 1 completed 2024-Sept-9
//
//Purpose
//  This program is a 'Hello World' program which demonstrates user input and output in Assembly and C++.
//
//Project information
//  Files: main.cpp, hello.asm, run.sh
//  Status: The program has been tested extensively with no detectable errors.
//
//Translator information
//  Gnu compiler: g++ -c -m64 -Wall -fno-pie -no-pie -l main.lis -o main.o main.cpp -std=c++2a
//  Gnu linker:   g++ -m64 -std=c++2a -o go.out hello.o main.o -fno-pie -no-pie 
//
//Execution: ./go.out
//
//References and credits
//  No references: this module is standard C++
//
//
//===== Begin code area ===================================================================================================================================================

#include <iostream>

extern "C" char* hello();                                                                               //connects the .cpp file to the .asm file

using namespace std;

int main (int argc, char* argv[]) {
    char *name; //stores name
    std::cout << "Welcome to this friendly 'Hello' program by Christine Mier" << endl;                  //Initial Message to begin Program
    name = hello();                                                                                     //Enter the .asm file and execute until final message is displayed
    std::cout << "Have a nice day " << name << "!" << endl;
    std::cout << "Goodbye. The integer zero will now be returned to the operating system." << endl;    //Final message of Program
    return 0;
}