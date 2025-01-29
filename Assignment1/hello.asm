;****************************************************************************************************************************
;Program name: "Assignment, The Hello World Program". This program demonstrates user input and output                       *
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
; Program name: Assignment 1, The Hello World Program
;  Programming languages X86 with one module in C++
;  Date development of version 1 began 2024-Aug-28
;  Date development of version 1 completed 2024-Sept-9
;
;Purpose
;  This program is a 'Hello World' program which demonstrates user input and output in Assembly and C++.
;
;Project information
;  Files: main.cpp, hello.asm, run.sh
;  Status: The program has been tested extensively with no detectable errors.
;
;Translator information
;  Linux: nasm -f elf64 -l hello.lis -o hello.o hello.asm
;References and credits
;   Holliday, 'String I/O 1.5'

;Format information
;  Page width: 172 columns
;  Begin comments: 61
;  Optimal print specification: Landscape, 7 points, monospace, 8Â½x11 paper
;
;===== Begin code area ====================================================================================================================================================

extern fgets    ;get input
extern printf   ;output strings
extern scanf    ;input numbers
extern stdin    ;keyboard input
extern strlen   ;string length
global hello    ;makes function callable

;Message Declarations
segment .data
    firstlast db "Please enter first and last names: ", 0
    title db "Please enter your title (Ms, Mr, Engineer, Programmer, Mathematician, Genius, etc): ", 0
    helloname db "Hello ", 0
    day db ". How has your day been so far? ", 0
    response db " is really nice.", 10, 0
    salary db "What is your salary in dollars? ", 0
    oh db "Oh, $", 0
    nice db " is very nice for a ", 0
    finalMsg db "This concludes the demonstration of the Hello program written in x86 assembly. ", 0
    stringformat db "%s", 0

segment .bss
    username resb 40

;Input and Output Strings
segment .text
hello:

;backup GPRs
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

;output request for first and last names
mov     rax, 0
mov     rdi, stringformat
mov     rsi, firstlast
call    printf

;input users names/delete newline created by fgets
mov     rax, 0
mov     rdi, username
mov     rsi, 40
mov     rdx, [stdin]
call    fgets

mov     rax, 0
mov     rdi, username
call    strlen      ;get length of string to delete newline
mov [username+rax-1], byte 0

;output request for title
mov     rax, 0
mov     rdi, stringformat
mov     rsi, title
call    printf

;input users title
mov     rax, 0
mov     rdi, title
mov     rsi, 40
mov     rdx, [stdin]
call    fgets

;output greeting (user title and name)
mov     rax, 0
mov     rdi, stringformat
mov     rsi, helloname
call    printf

mov     rax, 0
mov     rdi, stringformat
mov     rsi, title
call    printf

mov     rax, 0
mov     rdi, stringformat
mov     rsi, username
call    printf

;output question
mov     rax, 0
mov     rdi, stringformat
mov     rsi, day
call    printf

;input user response and delete newline created by fgets
mov     rax, 0
mov     rdi, day
mov     rsi, 40
mov     rdx, [stdin]
call    fgets

mov     rax, 0
mov     rdi, day
call    strlen
mov [day+rax-1], byte 0

;output response
mov     rax, 0
mov     rdi, stringformat
mov     rsi, day
call    printf

mov     rax, 0
mov     rdi, stringformat
mov     rsi, response
call    printf

;output salary Q
mov     rax, 0
mov     rdi, stringformat
mov     rsi, salary
call    printf

;input salary and delete newline created after fgets
mov     rax, 0
mov     rdi, salary
mov     rsi, 40
mov     rdx, [stdin]
call    fgets

mov     rax, 0
mov     rdi, salary
call    strlen
mov [salary+rax-1], byte 0

;output 'oh,' salary, 'nice', title to complement salary
mov     rax, 0
mov     rdi, stringformat
mov     rsi, oh
call    printf

mov     rax, 0
mov     rdi, stringformat
mov     rsi, salary
call    printf

mov     rax, 0
mov     rdi, stringformat
mov     rsi, nice
call    printf

mov     rax, 0
mov     rdi, stringformat
mov     rsi, title
call    printf

;output final message
mov     rax, 0
mov     rdi, stringformat
mov     rsi, finalMsg
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

;return
    mov rax, username
    ret