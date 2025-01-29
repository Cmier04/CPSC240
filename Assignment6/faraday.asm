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
;  Linux: nasm -f elf64 -l faraday.lis -o faraday.o faraday.asm
;
;References and credits
;
;Format information
;  Page width: 172 columns
;  Begin comments: 61
;  Optimal print specification: Landscape, 7 points, monospace, 8Â½x11 paper
;
;===== Begin code area ====================================================================================================================================================

extern driver
global faraday

;max_name_size equ 32
;max_career_size equ 32

segment .data
    name db "Please enter your full name: ", 0
    career db "Please enter the career path you are following: ", 0
    thank1 db "Thank you. We appreciate all ", 0

    EMF db "Please enter the EMF of your curcuit in volts: ", 0
    entered db "You entered: ", 0
    amps db "Please enter the current in this curcuit in amps: ", 0
    resistance db "The resistance in this curcuit is %ld ohms." 10, 0
    thank2 db "Thank you.", 0

    newline db 10, 0    ; Add newline character

segment .bss
    username resb 50
    usercareer resb 50
    EMF_input resb 20
segment .text
faraday:
;*****************************************************Intro to Program*****************************************************
    ;output name and prompt user for full name
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, name
    mov     rdx, 29
    syscall

    ;input username
    mov     rax, 0
    mov     rdi, 0
    mov     rsi, username
    mov     rdx, 50
    syscall

    ;output career
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, career
    mov     rdx, 48
    syscall

    ;input career
    mov     rax, 0
    mov     rdi, 0
    mov     rsi, usercareer
    mov     rdx, 50
    syscall

    ;output thank1
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, thank1
    mov     rdx, 31
    syscall

    ;output usercareer
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, usercareer
    mov     rdx, 50
    syscall

;*****************************************************Prompt EMF and store*****************************************************
    ;prompt for EMF
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, EMF
    mov     rdx, 47
    syscall

    ;input EMF
    mov     rax, 0
    mov     rdi, 0
    mov     rsi, EMF_input
    mov     rdx, 20
    syscall

    ;output entered
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, entered
    mov     rdx, 12
    syscall

    ;output EMF input
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, EMF_input
    mov     rdx, 20
    syscall

;*****************************************************Exit the Program*****************************************************
mov     rax, 60
mov     rdi, 0
syscall