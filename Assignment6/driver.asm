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
; Program name: Assignment 6, Execution Speed
;  Programming languages X86
;  Date development of version 1 began 2024-Dec-10
;  Date development of version 1 completed 2024-Dec-17
;
;Purpose
;   This file serves as the driver for Pure Assembly 
;Project information
;  Files: driver.asm, faraday.asm, r.sh
;  Status: The program has been tested extensively with no detectable errors.
;
;Translator information
;  Linux: nasm -f elf64 -l driver.lis -o driver.o driver.asm
;
;References and credits
;
;Format information
;  Page width: 172 columns
;  Begin comments: 61
;  Optimal print specification: Landscape, 7 points, monospace, 8Â½x11 paper
;
;===== Begin code area ====================================================================================================================================================

extern faraday
global driver

segment .data
    welcome_msg db "Welcome to Electricity brought to you by Christine Mier.", 10, 0
    explain_prgm db "This program will compute the resistance in your direct current circuit.", 10, 0

    number_msg db "The driver has recieved the number %ld and will keep it until next semester.", 10, 0
    bye db "A zero will be returned to the operating system."

    newline db 10, 0    ; Add newline character

segment .bss
    result resq 1

segment .text
driver:
;*****************************************************Welcome to Program*****************************************************
    ;output welcome_msg
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, welcome_msg
    mov     rdx, 56                     ;56 characters long
    syscall

    ;output newline
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, newline
    mov     rdx, 1
    syscall

    ;output explain_prgm
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, explain_prgm
    mov     rdx, 72
    syscall

    ;output newline
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, newline
    mov     rdx, 1
    syscall
;*****************************************************Outro of Program*****************************************************
    ;call faraday
    call    faraday
    movq    [result], xmm0

    ;output number_msg
    mov     rax, 1
    mov     rdi, number_msg
    mov     rsi, [result]
    mov     rdx, 76
    syscall

    ;output bye
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, bye
    mov     rdx, 48
    syscall

;*****************************************************Exit the Program*****************************************************
mov     rax, 60
mov     rdi, 0
syscall