;****************************************************************************************************************************
;Program name: "Assignment 5, Execution Speed". This program calculated the execution time of a taylor series.              *
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
; Program name: Assignment 5, Execution Speed
;  Programming languages X86 with one module in C
;  Date development of version 1 began 2024-Nov-13
;  Date development of version 1 completed 2024-Nov-26
;
;Purpose
;   This file calculates the taylor series values and returns the results to the series.asm file
;Project information
;  Files: main.c, series.asm, taylor.asm, r.sh
;  Status: The program has been tested extensively with no detectable errors.
;
;Translator information
;  Linux: nasm -f elf64 -l taylor.lis -o taylor.o taylor.asm
;
;References and credits
;
;Format information
;  Page width: 172 columns
;  Begin comments: 61
;  Optimal print specification: Landscape, 7 points, monospace, 8Â½x11 paper
;
;===== Begin code area ====================================================================================================================================================

extern series
extern fgets
extern stdin
extern printf
global taylor

segment .data
    stringformat db "%s", 0
    test_string db "**This is a test**", 10, 0
    one dq  1.0

segment .bss

segment .text
taylor:
;push GPRs
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
;*****************************************************Taylor Loop*****************************************************
    ;initialize variables
    mov     rax, 1
    movsd   xmm1, qword [one]
    movsd   xmm2, qword [one]
    movsd   xmm3, qword [one]

    ;initialize counter
    xor     rax, rax
loop:
    inc     rax
    cmp     rax, rdi
    jge     end_loop

    ;compute current term (x^n / n!)
    mulsd   xmm1, xmm0

    ;bottom = bottom * i
    cvtsi2sd    xmm4, rax
    mulsd   xmm2, xmm4

    movsd   xmm4, xmm1
    divsd   xmm1, xmm2
    addsd   xmm3, xmm1

    jmp     loop
    
end_loop:
    movsd   xmm0, xmm3

;restore GPRs
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