echo "Remove old executable files if there are any"
rm *.out

echo "Assemble the X86 file executive.asm"
nasm -f elf64 -l executive.lis -o executive.o executive.asm

echo "Assemble the X86 file fill_random_array.asm"
nasm -f elf64 -l fill_random_array.lis -o fill_random_array.o fill_random_array.asm

echo "Assemble the X86 file isnan.asm"
nasm -f elf64 -l isnan.lis -o isnan.o isnan.asm

echo "Assemble the X86 file show_array.asm"
nasm -f elf64 -l show_array.lis -o show_array.o show_array.asm

echo "Assemble the X86 file normalize_array.asm"
nasm -f elf64 -l normalize_array.lis -o normalize_array.o normalize_array.asm

echo "Compile the C++ file main.cpp"
g++ -c -m64 -Wall -fno-pie -no-pie -l main.lis -o main.o main.cpp -std=c++2a

echo "Compile the C++ file sort.cpp"
g++ -c -m64 -Wall -fno-pie -no-pie -l sort.lis -o sort.o sort.cpp -std=c++2a

echo "Link the two 'O' files main.o executive.o"
g++ -m64 -std=c++2a -o go.out executive.o fill_random_array.o isnan.o show_array.o normalize_array.o main.o sort.o -fno-pie -no-pie
#Note: "c++2a" is an early release of the "c++20" compiler.  
#When the compiler c++20 becomes available then replace "c++2a" with "c++20".

echo "Next the program ""String I/O"" will run"
./go.out