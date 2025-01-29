#Author: Christine Mier
#Email:cmier@csu.fullerton.edu
#date: 17-Dec-2024
#CPSC240- Final Program

echo "Remove old executable files if there are any"
rm *.out

echo "Assemble the X86 file manager.asm"
nasm -f elf64 -l manager.lis -o manager.o manager.asm

echo "Assemble the x86 file input_array.asm"
nasm -f elf64 -l input_array.lis -o input_array.o input_array.asm

echo "Assemble the x86 file output_array.asm"
nasm -f elf64 -l output_array.lis -o output_array.o output_array.asm

echo "Assemble the x86 file hmean.asm"
nasm -f elf64 -l hmean.lis -o hmean.o hmean.asm

echo "Compile the C file main.c"
gcc -c -Wall -m64 -no-pie -o main.o main.c -std=c11

echo "Link the two 'O' files main.o hello.o"
gcc -m64 -no-pie -o go.out -std=c11 manager.o input_array.o output_array.o main.o hmean.o
#Note: "c++2a" is an early release of the "c++20" compiler.  
#When the compiler c++20 becomes available then replace "c++2a" with "c++20".

echo "Next the program ""Final"" will run"
./go.out