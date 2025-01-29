;Author: Christine Mier
;Email: cmier@csu.fullerton.edu
;Course/Section: CPSC240-17 Final Program
;Date: Dec-17-2024

extern printf
extern manager
extern input_array
global output_array

segment .data
    intform db "%ld", 10, 0

segment .bss

segment .text
output_array:
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

;store data
mov     r14, rdi
mov     r15, rsi        ;rsi = how many
xor     r13, r13        ;r13 = index of array, increases by 1

beginloop:
    cmp     r13, r15        ;checks if r13 > r15
    jge     outsideloop

    ;output integer from array
    mov     rax, 0
    mov     rdi, intform
    mov     rsi, [r14 + 8 * r13]
    call    printf
    inc     r13             ;same as r13++, checks if it has reached limit
    jmp     beginloop

outsideloop:
    mov     rax, 0

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