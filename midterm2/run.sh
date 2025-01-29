echo "Assemble the source file manager.asm"
nasm -f elf64 -l manager.lis -o manager.o manager.asm

echo "Assemble the source file heron.asm"
nasm -f elf64 -l heron.lis -o heron.o heron.asm

echo "Compile the source file main.c"
gcc  -m64 -Wall -no-pie -o main.o -std=c2x -c main.c

echo "Link the object modules to create an executable file"
gcc -m64 -no-pie -o go.out heron.o manager.o main.o -std=c2x -Wall -z noexecstack -lm

echo "Execute the program"
chmod +x go.out
./go.out