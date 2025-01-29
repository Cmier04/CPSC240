;****************************************************************************************************************************
;Program name: "Assignment3, The Arrays Program". This program demonstrates the use of user input into an array and         *
;getting the sum of an array as well as sorting it using Assembly, C, and C++.                                              *
;Copyright (C) 2024  Christine Mier                                                                                         *
;This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
;version 3 as published by the Free Software Foundation.                                                                    *
;This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         *
;warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
;A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.                           *
;****************************************************************************************************************************




;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3=========4=========5=========6=========7**
;Author information
;  Author name: Christine Mier
;  Author email: cmier@csu.fullerton.edu
;
;Program information
; Program name: Assignment 3, The Array Program
;  Programming languages X86 with one module in C++ and one module in C
;  Date development of version 1 began 2024-Oct-04
;  Date development of version 1 completed 2024-Oct-13
;
;Purpose
;  This program is a 'Array' program which demonstrates the use of user input into an array and getting the sum of an array as well as sorting it using Assembly, C, and C++.
;
;Project information
;  Files: main.c, manager.asm, input_array.asm, isinteger.asm, output_array.asm, sum.asm, sort.cpp, run.sh
;  Status: The program has been tested extensively with no detectable errors. However, it does not print output of array correctly and does not call for sum of array correctly
;
;Translator information
;  Linux: nasm -f elf64 -l manager.lis -o manager.o manager.asm

;References and credits
; Khoa, "Input_Arry, manager.asm"

;Format information
;  Page width: 172 columns
;  Begin comments: 61
;  Optimal print specification: Landscape, 7 points, monospace, 8Â½x11 paper
;
;===== Begin code area ====================================================================================================================================================

;This would be input array in C: long unsigned input_array(long myarr[], long_size)
;unsure manager
extern printf
extern stdin
extern fgets
extern strlen
extern input_array
extern output_array
extern sum
extern sort
global manager
array_size equ 100

segment .data
    name db "Please enter your name: ", 0
    program db "This program will sum your array of integers.", 10, 0 "Enter a sequence of long integers followed by a white space. ", 10, 0 "After the last input press enter followed by Control+D: ", 10, 0
    outputarr db "These numbers were recieved and placed into the array:", 10, 0
    sumarray db "The sum of the %ld integer array is %ld.", 10, 0
    sorted db "This is the array sorted.", 10, 0
    return db " The program will return execution to the main function.", 10, 0

    stringformat db "%s", 0
    intformat db "%ld", 0

segment .bss
    myarray resq array_size
    username resb 40

segment .text
manager:
push rbp
mov rbp, rsp
push rbx
push rcx
push rdx
push rdi
push rsi
push r8
push r9
push r10
push r11
push r12
push r13
push r14
push r15
pushf

;print username
mov     rax, 0
mov     rdi, stringformat
mov     rsi, name
call    printf

;input username
mov     rax, 0
mov     rdi, username
mov     rsi, 40
mov     rdx, [stdin]
call    fgets

mov     rax, 0
mov     rdi, username
call    strlen      ;get length of string to delete newline
mov [username+rax-1], byte 0

;output program
mov     rax, 0
mov     rdi, stringformat
mov     rsi, program
call    printf

;get values from user by calling input_array
;mov     rax, 0
mov     rdi, myarray
mov     rsi, array_size
call    input_array
mov     r15, rax

;output array, confirm
mov     rax, 0
mov     rdi, stringformat
mov     rsi, outputarr
call    printf

;call output array
mov     rax, 0
mov     rdi, myarray
mov     rsi, r15
call    output_array

;call sum
mov     rax, 0
mov     rdi, myarray
mov     rsi, r15
call    sum

;output sum
mov     rax, 0
mov     rdi, stringformat
mov     rsi, sumarray
call    printf

;output sorted array
mov     rax, 0
mov     rdi, stringformat
mov     rsi, sorted
call    printf

;call sorted
mov     rax, 0
mov     rdi, myarray
mov     rsi, r15
call    sort

;print sorted array
mov     rax, 0
mov     rdi, intformat
mov     rsi, myarray
call    printf

;output return
mov     rax, 0
mov     rdi, stringformat
mov     rsi, return
call    printf

;16 pops
popf
pop r15
pop r14
pop r13
pop r12
pop r11
pop r10
pop r9
pop r8
pop rsi
pop rdi
pop rdx
pop rcx
pop rbx
pop rbp

mov     rax, username
ret