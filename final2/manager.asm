;Author: Christine Mier
;Email: cmier@csu.fullerton.edu
;Course/Section: CPSC240-17 Final Program
;Date: Dec-17-2024

extern printf
extern stdin
extern fgets
extern strlen
extern input_array
extern output_array
extern sum
global manager
array_size equ 100

segment .data
    program db "This program will find the harmonic mean of your array.", 10, 0 
    inputarr db "Enter a sequence of numbers followed by a white space. After the last input press enter followed by Control+D: ", 10, 0
    outputarr db "These numbers were recieved and placed into the array:", 10, 0
    sumarray db "The mean of the %ld array is %ld.", 10, 0
    return db " The program will return execution to the main function.", 10, 0

    stringformat db "%s", 0
    floatformat db "%ld", 0

segment .bss
    myarray resq array_size
    mean resb 1024

segment .text
manager:
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

;output program
mov     rax, 0
mov     rdi, stringformat
mov     rsi, program
call    printf

mov     rax, 0
mov     rdi, stringformat
mov     rsi, inputarr
call    printf

;get values from user by calling input_array
;mov     rax, 0
mov     rdi, myarray
mov     rsi, array_size
call    input_array
mov     r15, rax

;output array, confirm
mov     rax, 0
mov     rdi, stringformat
mov     rsi, outputarr
call    printf

;call output array
mov     rax, 0
mov     rdi, myarray
mov     rsi, r15
call    output_array

;--------------------------------harmonic mean-----------------------------
;output hmean
mov     rax, 0
mov     rdi, stringformat
mov     rsi, sumarray
call    printf

;call   hmean
mov     rax, 0
mov     rdi, mean
mov     rsi, r15
call    sum

;output return
mov     rax, 0
mov     rdi, stringformat
mov     rsi, return
call    printf

;16 pops
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