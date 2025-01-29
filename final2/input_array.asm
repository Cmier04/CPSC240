;Author: Christine Mier
;Email: cmier@csu.fullerton.edu
;Course/Section: CPSC240-17 Final Program
;Date: Dec-17-2024

extern printf
extern fgets
extern scanf
extern stdin
extern atol
extern manager
global input_array

;isdigit only tests one character and isint tests the whole inputted value
segment .data
    stringformat db "%s", 0
    intformat db "%ld", 0
segment .bss
    ;remains empty
segment .text
input_array:
;16 pushes
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

;backup incoming parameters:
    mov     r14, rdi        ;r14 is the array that was declared in caller function
    mov     r15, rsi        ;r15 is max number of elements that can be stored in array
    ;rdi and rsi are free to use but r14 and r15 are fixed

    xor     r13, r13        ;faster execution than mov r13,0;; x13 counts numbers inserted into the array
    sub     rsp, 800        ;800 bytes = 100 qwords, eq of pushing rax 300 times

beginloop:
    ;prompt for input
    ;input a number
    mov     rax, 0
    mov     rdi, rsp        ;first parameter for fgets and second is for storage
    mov     rsi, 799        ;leave 1 byte for null character
    mov     rdx, [stdin]
    call    fgets
    ;if ctrl+D is detected, end function
    cmp     rax, 0         ;try cmp rax, 0
    je      loopdone        ;if it doesn't work, try changing to beginloop

    ;convert string on top of stack to int
    mov     rax, 0
    mov     rdi, rsp
    call    atol            ;in C++ library and places answer in rax
    mov     [r14 + 8 * r13], rax

    inc     r13             ;inc is like r13++ so it is counted, incremented
    cmp     r13, r15        ;checks if count has reached limit (max size of the array), if r13 = r15
    jge     loopdone
    jmp     beginloop

loopdone:               ;ctrl d sends here and if it's done aswell

    mov     rax, r13
    add     rsp, 800

    mov     rax, r13

;16 pops     no rax here
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