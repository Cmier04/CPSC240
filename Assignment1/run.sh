#!/bin/bash

#Author: Christine Mier
#Program name: Assignment 1, The Hello World Program
#Purpose: This is a Bash script file whose purpose is to compile and run the program "Assignment1, The Hello World Program".

echo "Remove old executable files if there are any"
rm *.out

echo "Assemble the X86 file hello.asm"
nasm -f elf64 -l hello.lis -o hello.o hello.asm

echo "Compile the C++ file main.cpp"
g++ -c -m64 -Wall -fno-pie -no-pie -l main.lis -o main.o main.cpp -std=c++2a

echo "Link the two 'O' files main.o hello.o"
g++ -m64 -std=c++2a -o go.out hello.o main.o -fno-pie -no-pie
#Note: "c++2a" is an early release of the "c++20" compiler.  
#When the compiler c++20 becomes available then replace "c++2a" with "c++20".

echo "Next the program ""Assignment1"" will run"
./go.out