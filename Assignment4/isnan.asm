;****************************************************************************************************************************
;Program name: "Assignment 4, Non-Deterministic Random Numbers". This program generates random IEEE754 numbers and          *
;displays their scientific decimal form, as well as sorts and displays the array of random numbers.                         *
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
; Program name: Assignment 4, Non-Deterministic Random Numbers
;  Programming languages X86 with two modules in C++
;  Date development of version 1 began 2024-Oct-22
;  Date development of version 1 completed 2024-Nov-03
;
;Purpose
;  This program generates random IEEE754 numbers and displays their scientific decimal form as well as sorts and displays the array of random numbers.
;
;Project information
;  Files: main.cpp, executive.asm, fill_random_array.asm, show_array.asm, normalize_array.asm, isnan.asm, sort.cpp, run.sh
;  Status: The program has been tested extensively with no detectable errors. However, it does not normalize the array and sorts/prints the normalized array as
;          this function call has been removed due to an infinite loop issue.
;
;Translator information
;  Linux: nasm -f elf64 -l isnan.lis -o isnan.o isnan.asm

;References and credits

;Format information
;  Page width: 172 columns
;  Begin comments: 61
;  Optimal print specification: Landscape, 7 points, monospace, 8Â½x11 paper
;
;===== Begin code area ====================================================================================================================================================

global isnan

segment .data

segment .bss

segment .text
isnan:
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

;move number into xmm15
movsd     xmm15, xmm0

;check if number is nan and jump to nan function
ucomisd     xmm15, xmm15
jp      nan
mov     rax, 1
jmp     endloop

;nan function if is nan
nan:
mov     rax, 0

;exit functon
endloop:

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