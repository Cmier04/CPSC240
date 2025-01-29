#!/bin/bash

#Author: Christine Mier
#Program name: Assignment 5, Execution Speed
#Purpose: This is a Bash script file whose purpose is to compile and run the program "Assignment5, Execution Speed".

echo "Remove old executable files if there are any"
rm *.out

echo "Assemble the X86 file series.asm"
nasm -f elf64 -l series.lis -o series.o series.asm

echo "Assemble the X86 file isfloat.asm"
nasm -f elf64 -l taylor.lis -o taylor.o taylor.asm

echo "Compile the C++ file main.c"
gcc -c -Wall -m64 -no-pie -o main.o main.c -std=c11

echo "Link the two 'O' files main.o series.o taylor.o"
gcc -m64 -no-pie -o go.out -std=c11 series.o taylor.o main.o

echo "Next the program ""Assignment2"" will run"
./go.out