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
;  Linux: nasm -f elf64 -l sum.lis -o sum.o sum.asm

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
extern input_array
extern output_array
global sort
global sum

segment .data

segment .bss

segment .text
sum:
;16 push
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

;save all int numbers

;back
mov     r14, rdi
mov     r15, rsi        ;r15 = how many
xor     r13, r13        ;r13 = loop counter

xor     r8, r8          ;r8 = accumalater

beginloop:
    ;check if array is full to end loop
    cmp     r13, r15         ;comparing the two to see if you can exit loop
    jge     endloop

    ;add elements in array
    addsd   xmm15, [r14 + r13 * 8]
    inc     r13

    ;repeat loop
    jmp beginloop
endloop:
    push    qword 0
    movsd   [rsp], xmm15
    ;mov     rax, r8        originally placed here by professor
    ;restore sum
    movsd   xmm0, [rsp]
    pop     rax

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

ret