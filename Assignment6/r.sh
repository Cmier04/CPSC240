#!/bin/bash

#Author: Christine Mier
#Program name: Assignment 6, Pure Assembly
#Purpose: This is a Bash script file whose purpose is to compile and run the program "Assignment6, Pure Assembly".

echo "Remove old executable files if there are any"
rm *.out

echo "Assemble the X86 file driver.asm"
nasm -f elf64 -l driver.lis -o driver.o driver.asm

echo "Assemble the X86 file faraday.asm"
nasm -f elf64 -l faraday.lis -o faraday.o faraday.asm

echo "Link the two 'O' files driver.o faraday.o"
ld -o go.out driver.o faraday.o -g

echo "Next the program ""Assignment6"" will run"
./go.out