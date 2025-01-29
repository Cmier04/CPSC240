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
;  This   generates random IEEE754 numbers and displays their scientific decimal form as well as sorts and displays the array of random numbers.
;
;Project information
;  Files: main.cpp, executive.asm, fill_random_array.asm, show_array.asm, normalize_array.asm, isnan.asm, sort.cpp, run.sh
;  Status: The program has been tested extensively with no detectable errors. However, it does not normalize the array and sorts/prints the normalized array as
;          this function call has been removed due to an infinite loop issue.
;
;Translator information
;  Linux: nasm -f elf64 -l executive.lis -o executive.o executive.asm

;References and credits

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
extern strlen
extern fill_random_array
extern show_array
extern normalize_array
extern sort
max_name_size equ 32
max_title_size equ 32

global executive

segment .data
    name db "Please enter your name: ", 0
    title db "Please enter your title (Mr, Ms, Sargent, Chief, Project, Leader, etc): ", 0
    nice db "Nice to meet you %s %s.", 10, 0
    prgrm_msg db "This program will generate 64 bit IEEE float numbers.", 10, 0
    nmbrs db "How many numbers do you want? Today's limit is 100 per customer: ", 0
    stored_msg db "Your numbers have been stored in an array. Here is that array: ",10, 0
    try_again db "The array size you entered is out of bounds. Please try again.", 10, 0
    normalized db "The array will now be normalized to the range 1.0 to 2.0  Here is the normalized array", 10, 0               ;unused due to issue in normalize_array file/function
    sorted db "The array will now be sorted.", 10, 0
    goodbye db "Goodbye %s. You are welcome any time.", 10, 0

    testline db "Does this print", 0                ;used to test where program was breaking

    stringformat db "%s", 0
    intformat db "%ld", 0

segment .bss
    align 64
    backup_storage_area resb 832
    username resb max_name_size
    usertitle resb max_title_size
    my_array resq 100

segment .text
executive:
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
;Prompt user for name
mov     rax, 0

mov     rdi, name
call    printf

;input username
mov     rax, 0
mov     rdi, username
mov     rsi, max_name_size
mov     rdx, [stdin]
call    fgets

mov     rax, 0
mov     rdi, username
call    strlen
mov [username+rax-1], byte 0                ;removes newline at the end of fgets

;prompt user for title
mov     rax, 0

mov     rdi, title
call    printf

mov     rax, 0
mov     rdi, usertitle
mov     rsi, max_title_size
mov     rdx, [stdin]
call    fgets

mov     rax, 0
mov     rdi, usertitle
call    strlen
mov [usertitle+rax-1], byte 0               ;removes newline at the end of fgets

;output nice to meet you message
mov     rax, 0
mov     rdi, nice
mov     rsi, usertitle
mov     rdx, username
call    printf

;missing info


;*****************************************************Array Size*****************************************************
;output prgrm_msg
mov     rax, 0
mov     rdi, stringformat               ;unnnecessary, could use rdi, program_msg instead
mov     rsi, prgrm_msg
call    printf

get_size:
;output nmbrs which prompts the user to input an array size
mov     rax, 0
mov     rdi, stringformat
mov     rsi, nmbrs
call    printf

;convert float to int and prepare to compare the size to the allowed size limit
push    qword 0
push    qword 0
mov     rax, 0
mov     rdi, intformat                  ;used to format integers in the array after converting to int from float
mov     rsi, rsp
call    scanf                           ;reads the generated numbers in array
mov     r15, [rsp]
pop     rax
pop     rax

;if size of array is not within limits of 0-100
cmp     r15, 0                          ;checks if the inputted size is less than the limit
jl      wrong_size
cmp     r15, 100                        ;checks if inputted size is greater than limit
jg      wrong_size

;if size of array is within limits of 0-100
jmp     continue

;if array size given is greater than or less than limit, jump to this loop
wrong_size:
mov     rax, 0
mov     rdi, try_again
call    printf
jmp     get_size

;if array size is within the limit:
continue:
mov     rax, 0
mov     rdi, my_array
mov     rsi, r15
call    fill_random_array               ;call the fill_random_array function in the other file to store array


;*****************************************************Call Show_array*****************************************************
;output stored_msg to confirm array size was stored and an array of random numbers will be printed
mov     rax, 0
mov     rdi, stringformat               ;again, not really needed
mov     rsi, stored_msg
call    printf

;print array of random numbers by calling show_array
mov     rax, 0
mov     rdi, my_array
mov     rsi, r15
call    show_array

;*****************************************************Normalize Array*****************************************************
;Removed from program because it created an infinite loop

;*****************************************************Sort Array*****************************************************
;sort array
mov     rdi, my_array
mov     rsi, r15
call    sort

;output sorted
mov     rax, 0
mov     rdi, sorted
call    printf

;output sorted array
mov     rax, 0
mov     rdi, my_array
mov     rsi, r15
call    show_array

;*****************************************************Goodbye Message*****************************************************
;output goodbye
mov     rax, 0
mov     rdi, goodbye
mov     rsi, usertitle
call    printf

;*****************************************************End of Program*****************************************************
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

;return username and usertitle to main.cpp
mov     rax, username

ret