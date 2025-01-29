#!/bin/bash

#Author: Christine Mier
#Program name: Assignment 2, Average Driving Time
#Purpose: This is a Bash script file whose purpose is to compile and run the program "Assignment2, Average Driving Time".

echo "Remove old executable files if there are any"
rm *.out

echo "Assemble the X86 file average.asm"
nasm -f elf64 -l average.lis -o average.o average.asm

echo "Assemble the X86 file isfloat.asm"
nasm -f elf64 -l isfloat.lis -o isfloat.o isfloat.asm

echo "Compile the C++ file driver.c"
gcc -c -Wall -m64 -no-pie -o driver.o driver.c -std=c11

echo "Link the two 'O' files main.o hello.o"
gcc -m64 -no-pie -o go.out -std=c11 average.o isfloat.o driver.o

echo "Next the program ""Assignment2"" will run"
./go.out