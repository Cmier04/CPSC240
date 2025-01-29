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
;  Linux: nasm -f elf64 -l fill_random_array.lis -o fill_random_array.o fill_random_array.asm

;References and credits

;Format information
;  Page width: 172 columns
;  Begin comments: 61
;  Optimal print specification: Landscape, 7 points, monospace, 8Â½x11 paper
;
;===== Begin code area ====================================================================================================================================================

extern printf
extern isnan

global fill_random_array

segment .data

segment .bss
;possible no declarations

segment .text
fill_random_array:

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

;get array address/size and store
mov     r15, rdi        ;my_array is stored here
mov     r14, rsi

;set array counter to 0
mov     r13, 0

;check if array size limit reached
array_capacity:
cmp     r13, r14
jl      is_less

;if array is full
jmp     exit

;is_less function if array capacity is not reached
is_less:
;generate random number and input it into array
fill_array:
mov     rax, 0
rdrand  r12                 ;from class notes
mov     rdi, r12
push    r12
push    r12
movsd   xmm15, [rsp]
pop     r12
pop     r12

;check if random number is nan by calling isnan function and loop through loop again if nan
movsd   xmm0, xmm15
call    isnan
cmp     rax, 0
je      fill_array

;if number is not nan, store in array
movsd   [r15 + r13 * 8], xmm15

;increment counter so you're able to tell if/when array is full
inc     r13
jmp     array_capacity

;exit function when array capacity is full
exit:

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