;****************************************************************************************************************************
;Program name: "Assignment 2, Average Driving Time". This program demonstrates user input and output                       *
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
; Program name: Assignment 2, Average Driving Time
;  Programming languages X86 with one module in C
;  Date development of version 1 began 2024-Sept-21
;  Date development of version 1 completed 2024-Sept-25
;
;Purpose
;  This program calculate the average driving time, speed, and total distance of a trip. It is meant to demonstrate how to use arithmetic in x86.
;
;Project information
;  Files: driver.c, average.asm, isfloat.asm,  run.sh
;  Status: The program has been tested extensively with errors which inclue: failure to remove newline characters, incorrect calculations, and failure to return average speed to driver.c.
;
;Translator information
;  Linux: nasm -f elf64 -l average.lis -o average.o average.asm
;References and credits
;   Holliday, 'Isfloat.asm'

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
extern isfloat
extern atof
global driver

segment .data

    name db "Please enter your first and last names: ", 0
    title db "Please enter your title such as Lieutenant, Chief, Mr, Ms, Influencer, Chairman, FreshmanForeman, Project Leader, etc: ", 0
    milesFulSa db "Enter the number of miles traveled from Fullerton to Santa Ana: ", 0
    milesSaLB db "Enter the number of miles traveled from Santa Ana to Long Beach: ", 0
    milesLBFul db "Enter the number of miles traveled from Long Beach to Fullerton: ", 0
    speedprompt db "Enter your average speed during that leg of the trip: ", 0
    processing db "The inputted data is being processed.", 10, 0
    totaldistance db "The total disctance traveled is: ", 0
    totaltime db "The total time traveled is: ", 0
    averagespeed db "The average speed of this trip is: ", 0
    distance db " miles.",10, 0
    time db " hours.", 10, 0
    speed db " mph.", 10, 0


    miles1 dq 1024
    speed1 dq 1024
    miles2 dq 1024
    speed2 dq 1024
    miles3 dq 1024
    speed3 dq 1024
    speedavg dq 3.0

    number_format db "%lf", 10, 0 ;prints double
    thankyou db "Thank you ", 0
    stringformat db "%s", 0

segment .bss
    ;miles dq 1024

segment .text
driver:

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

;output request for username
mov     rax, 0
mov     rdi, stringformat
mov     rsi, name
call    printf

;remove newline
mov     rax, 0
mov     rdi, name
call    strlen
mov     [name+rax-1], byte 0

;input username
mov     rax, 0
mov     rdi, name
mov     rsi, 40
mov     rdx, [stdin]
call    fgets

;output prompt for user title
mov     rax, 0
mov     rdi, stringformat
mov     rsi, title
call    printf

;input title
mov     rax, 0
mov     rdi, title
mov     rsi, 40
mov     rdx, [stdin]
call fgets

;output Thank You, title, username
mov     rax, 0
mov     rdi, stringformat
mov     rsi, thankyou
call    printf

mov     rax, 0
mov     rdi, stringformat
mov     rsi, title
call    printf

mov     rax, 0
mov     rdi, stringformat
mov     rsi, name
call    printf

;output milesFulSa
mov     rax, 0
mov     rdi, stringformat
mov     rsi, milesFulSa
call    printf

;*****************************Fullerton to Santa Ana Miles*********************************
;input integer of miles Fullerton to Santa Ana
mov     rax, 0
mov     rdi, miles1
mov     rsi, 1024
mov     rdx, [stdin]
call    fgets
;remove newline
mov     rax, 0
mov     rdi, miles1
call    strlen
mov     [miles1+rax-1], byte 0
;*********validate integer input************
mov     rax, 0
mov     rdi, miles1
call    isfloat     ;rax = T or F
;if input is float:Convert milesnumber to real float
mov     rdi, miles1
call    atof
;result stored in xmm0
movsd   xmm15, xmm0

;****************************Fulerton to Santa Ana Speed*************************************
;output sppedprompt
mov     rax, 0
mov     rdi, stringformat
mov     rsi, speedprompt
call    printf

;input speed
mov     rax, 0
mov     rdi, speed1
mov     rsi, 1024
mov     rdx, [stdin]
call    fgets

;remove newline
mov     rax, 0
mov     rdi, speed1
call    strlen
mov     [speed1 + rax - 1], byte 0

;validate user input
mov     rax, 0
mov     rdi, speed1
call    isfloat

;if input isfloat, convert speed to float
mov     rdi, speed1
call    atof

;result stored in xmm
movsd   xmm14, xmm0

;*****************************Santa Ana to Long Beach Miles*********************************
;output milesSaLB
mov     rax, 1
mov     rdi, stringformat
mov     rsi, milesSaLB
call    printf

;input miles2
mov     rax, 0
mov     rdi, miles2
mov     rsi, 1024
mov     rdx, [stdin]
call    fgets

;remove newline
mov     rax, 0
mov     rdi, miles2
call    strlen
mov     [miles2 + rax - 1], byte 0

;validate user input
mov     rax, 0
mov     rdi, miles2
call    isfloat

;if input isfloat, convert miles to float
mov     rdi, miles2
call    atof

;result stored in xmm
movsd   xmm13, xmm0

;*****************************Santa Ana to Long Beach Speed*********************************
;output speedSaLB
mov     rax, 0
mov     rdi, stringformat
mov     rsi, speedprompt
call    printf

;input speed
mov     rax, 0
mov     rdi, speed2
mov     rsi, 1024
mov     rdx, [stdin]
call    fgets

;remove newline
mov     rax, 0
mov     rdi, speed2
call    strlen
mov     [speed2 + rax - 1], byte 0

;validate user input
mov     rax, 0
mov     rdi, speed2
call    isfloat

;if input isfloat, convert speed to float
mov     rdi, speed2
call    atof

;result stored in xmm
movsd   xmm12, xmm0

;*****************************Long Beach to Fullerton Miles*********************************
;output milesLBFul
mov     rax, 1
mov     rdi, stringformat
mov     rsi, milesLBFul
call    printf

;input miles3
mov     rax, 0
mov     rdi, miles3
mov     rsi, 1024
mov     rdx, [stdin]
call    fgets

;remove newline
mov     rax, 0
mov     rdi, miles3
call    strlen
mov     [miles3 + rax - 1], byte 0

;validate user input
mov     rax, 0
mov     rdi, miles3
call    isfloat

;if input isfloat, convert miles to float
mov     rdi, miles3
call    atof

;result stored in xmm
movsd   xmm11, xmm0

;*****************************Long Beach to Fullerton Speed*********************************
;output speedSaLB
mov     rax, 0
mov     rdi, stringformat
mov     rsi, speedprompt
call    printf

;input speed
mov     rax, 0
mov     rdi, speed3
mov     rsi, 1024
mov     rdx, [stdin]
call    fgets

;remove newline
mov     rax, 0
mov     rdi, speed3
call    strlen
mov     [speed3 + rax - 1], byte 0

;validate user input
mov     rax, 0
mov     rdi, speed3
call    isfloat

;if input isfloat, convert speed to float
mov     rdi, speed3
call    atof

;result stored in xmm
movsd   xmm10, xmm0


;*****************************Calculate Total Distance Traveled*********************************
;output processing
mov     rax, 0
mov     rdi, stringformat
mov     rsi, processing
call printf

;add distances
addsd   xmm15, xmm13    ;miles1 + miles2
addsd   xmm15, xmm11     ;miles3

;output total
mov     qword rax, 1
mov     rdi, stringformat
mov     rsi, totaldistance
call    printf

mov     rdi, number_format
movsd   xmm0, xmm15
call printf

mov     rax, 0
mov     rdi, stringformat
mov     rsi, distance
call printf

;*****************************Calculate Total Time Traveled*********************************
;Ful to Sa
divsd   xmm15, xmm14    ;miles1/speed1

;Sa to LB
divsd   xmm13, xmm12    ;miles2/speed2

;LB to Ful
divsd   xmm11, xmm10    ;miles3/speed3

;total time traveled
addsd   xmm15, xmm13    ;add 
addsd   xmm15, xmm11

;output total time traveled
mov     rax, 1
mov     rdi, stringformat
mov     rsi, totaltime
call    printf

mov     rdi, number_format
movsd   xmm0, xmm15
call    printf

mov     rax, 0
mov     rdi, stringformat
mov     rsi, time
call    printf

;*****************************Calculate Average Speed of Trip*********************************
;add speeds together
addsd   xmm14, xmm12
addsd   xmm15, xmm10

;divide total by number of floats
divsd   xmm15, qword[speedavg]

;output average speed
mov     rax, 1
mov     rdi, stringformat
mov     rsi, averagespeed
call    printf

mov     rdi, number_format
movsd   xmm0, xmm15
call    printf

;remove newline
mov     rax, 0
mov     rdi, averagespeed
call    strlen
mov     [averagespeed + rax - 1], byte 0

mov     rax, 0
mov     rdi, stringformat
mov     rsi, speed
call    printf

;*************************return average speed to C file******************************
movsd xmm0, xmm15       ;does not work

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
    mov     rax, miles1
    ret
