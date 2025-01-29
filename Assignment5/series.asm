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
;   This file handles the input and output of the "Execution Speed" program
;Project information
;  Files: main.c, series.asm, taylor.asm, r.sh
;  Status: The program has been tested extensively with no detectable errors.
;
;Translator information
;  Linux: nasm -f elf64 -l series.lis -o series.o series.asm
;
;References and credits
;
;Format information
;  Page width: 172 columns
;  Begin comments: 61
;  Optimal print specification: Landscape, 7 points, monospace, 8Â½x11 paper
;
;===== Begin code area ====================================================================================================================================================

extern printf
extern fgets
extern stdin
extern atof
extern taylor 
global series

segment .data
    intro_msg db "This software will compute any power of e that you may need.",10, 0 
    
    enterfloatx db "Enter float value for x: ", 0
    enterterms db "Enter the number of terms in the Taylor sum: ", 0
    start_time db "The time on the clock is now %lu tics and taylor has been called.", 10, 0
    end_time db "The time on the clock when Taylor terminated was %lu tics.", 10, 0
    execution_time db "The execution time was %lu tics.", 10, 0
    thanks db "Thank you for waiting.", 10, 0

    taylor_results db "The computed approximation of e^x is %lf with precision of 8 digits to the right of the point.", 10, 0

    thank_you db "Thank you for using the Mier exponential calculator.", 10, 0
    return db "Please return another day. The computed value will be sent to the caller function.", 10, 0
    
    stringformat db "%s", 0

segment .bss
    ;store the power of e here, this should interact with the taylor file
    x resb 1024
    terms resb 1024
segment .text
series:
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
;*****************************************************Introduction of Program*****************************************************
    ;output intro_msg
    mov     rax, 0
    mov     rdi, stringformat
    mov     rsi, intro_msg
    call    printf

;*****************************************************Input Numbers of Program*****************************************************
    ;NUMBER INPUT, STORING, AND HANDLING
    ;output enterfloatx
    mov     rax, 0
    mov     rdi, stringformat
    mov     rsi, enterfloatx
    call    printf

    ;input float x as string and convert to float
    mov     rax, 0
    mov     rdi, x
    mov     rsi, 1024
    mov     rdx, [stdin]
    call    fgets
    
    mov     rdi, x
    call    atof
    movsd   xmm12, xmm0                         ;x stored in xmm12

    ;output enterterms
    mov     rax, 0
    mov     rdi, stringformat
    mov     rsi, enterterms
    call    printf

    ;input terms as string and convert to float
    mov     rax, 0
    mov     rdi, terms
    mov     rsi, 1024
    mov     rdx, [stdin]
    call    fgets

    mov     rdi, terms
    call    atof
    movsd   xmm13, xmm0                         ;number of terms stored in xmm13

;*****************************************************Start time and Call Taylor*****************************************************
    ;get start time
    cpuid
    rdtsc
    shl     rdx, 32
    add     rdx, rax
    mov     r15, rdx                    ;store time in r12 register

    ;output start_time
    mov     rax, 0
    mov     rdi, start_time
    mov     rsi, r15                    ;get time from r12 register
    call    printf

    ;call taylor
    movsd   xmm0, [x]
    mov     rdi, terms
    call    taylor
    movsd   xmm15, xmm0                 ;move result into xmm15 (less volatile register)

    ;output thanks
    mov     rax, 0
    mov     rdi, stringformat
    mov     rsi, thanks
    call    printf

;*****************************************************End time and Execution time*****************************************************
    ;get end time
    cpuid
    rdtsc
    shl     rdx, 32
    add     rdx, rax
    mov     r14, rdx

    ;output end time
    mov     rax, 0
    mov     rdi, end_time
    mov     rsi, r14
    call    printf

    ;get execution time
    sub     r14, r15

    ;output execution time
    mov     rax, 0
    mov     rdi, execution_time
    mov     rsi, r14
    call    printf

;*****************************************************Taylor Series Results*****************************************************
    ;output result of taylor
    mov     rax, 1
    mov     rdi, taylor_results
    movsd   xmm0, xmm15
    call    printf

;*****************************************************Outro of Program and return to main.c*****************************************************
    ;output thanks
    mov     rax, 0
    mov     rdi, stringformat
    mov     rsi, thank_you
    call    printf

    ;output return
    mov     rax, 0
    mov     rdi, stringformat
    mov     rsi, return
    call    printf

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