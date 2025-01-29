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
;  Linux: nasm -f elf64 -l input_array.lis -o input_array.o input_array.asm

;References and credits
; Holliday

;Format information
;  Page width: 172 columns
;  Begin comments: 61
;  Optimal print specification: Landscape, 7 points, monospace, 8Â½x11 paper
;
;===== Begin code area ====================================================================================================================================================

extern printf
extern fgets
extern scanf
extern stdin
extern atol
extern manager
extern isinteger
global input_array

;isdigit only tests one character and isint tests the whole inputted value
segment .data
    stringformat db "%s", 0
    intformat db "%ld", 0
    invalid db "Input is not an integer, try again.", 10, 0
segment .bss
    ;remains empty
segment .text
input_array:
;16 pushes
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

;backup incoming parameters:
    mov     r14, rdi        ;r14 is the array that was declared in caller function
    mov     r15, rsi        ;r15 is max number of elements that can be stored in array
    ;rdi and rsi are free to use but r14 and r15 are fixed

    xor     r13, r13        ;faster execution than mov r13,0;; x13 counts numbers inserted into the array
    sub     rsp, 800        ;800 bytes = 100 qwords, eq of pushing rax 300 times

beginloop:
    ;prompt for input
    ;input a number
    mov     rax, 0
    mov     rdi, rsp        ;first parameter for fgets and second is for storage
    mov     rsi, 799        ;leave 1 byte for null character
    mov     rdx, [stdin]
    call    fgets
    ;if ctrl+D is detected, end function
    cmp     rax, 0         ;try cmp rax, 0
    je      loopdone        ;if it doesn't work, try changing to beginloop

    ;Test for integer input
    xor     rax, 0          ;try mov instead of xor
    mov     rdi, rsp
    call    isinteger       ;returns 0 if false and returns other if integer, find and use
    cmp     rax, -1
    je      tryagain       ;prompt tryagain instead******

    ;convert string on top of stack to int
    mov     rax, 0
    mov     rdi, rsp
    call    atol            ;in C++ library and places answer in rax
    mov     [r14 + 8 * r13], rax

    inc     r13             ;inc is like r13++ so it is counted, incremented
    cmp     r13, r15        ;checks if count has reached limit (max size of the array), if r13 = r15
    jge     loopdone
    jmp     beginloop

    tryagain:
    mov     rax, 0
    mov     rdi, invalid
    call    printf
    jmp     beginloop


loopdone:               ;ctrl d sends here and if it's done aswell

    mov     rax, r13
    add     rsp, 800

    mov     rax, r13

;16 pops     no rax here
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

;DO NOT PLACE mov rax, r13 her because it will change
    ret


;--------------------------Class Notes---------------------------
;unicode: code number to every known character on earth
;wsl/linux
;control + shift + U
;release
;0x00AZ 0x21AF
;ONLY ONE INTEGER INPUT PER LINE
;returns how many numbers in array to manager.asm


