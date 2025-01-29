#!/bin/bash

#Author: Christine Mier
#Program name: Assignment 3, Arrays
#Purpose: This is a Bash script file whose purpose is to compile and run the program "Assignment3, Arrays".

echo "Remove old executable files if there are any"
rm *.out

echo "Assemble the X86 file manager.asm"
nasm -f elf64 -l manager.lis -o manager.o manager.asm

echo "Assemble the x86 file input_array.asm"
nasm -f elf64 -l input_array.lis -o input_array.o input_array.asm

echo "Assemble the x86 file output_array.asm"
nasm -f elf64 -l output_array.lis -o output_array.o output_array.asm

echo "Assemble the x86 file sum.asm"
nasm -f elf64 -l sum.lis -o sum.o sum.asm

echo "Assemble the x86 file isintiger.asm"
nasm -f elf64 -l isinteger.lis -o isinteger.o isinteger.asm

echo "Compile the C file main.c"
gcc -c -Wall -m64 -no-pie -o main.o main.c -std=c11

echo "Compile the C++ file sort.cpp"
gcc -c -Wall -m64 -no-pie -o sort.o sort.cpp

echo "Link the two 'O' files main.o hello.o"
gcc -m64 -no-pie -o go.out -std=c11 manager.o input_array.o output_array.o sum.o isinteger.o main.o sort.o
#Note: "c++2a" is an early release of the "c++20" compiler.  
#When the compiler c++20 becomes available then replace "c++2a" with "c++20".

echo "Next the program ""Assignment3"" will run"
./go.out