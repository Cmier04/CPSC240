extern printf
global heron

section .data
    error_msg db "Error encountered", 10, 0
    two dq 2.0

section .text
heron:
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

    ; Save input parameters
    movsd xmm3, xmm0  ; a
    movsd xmm4, xmm1  ; b
    movsd xmm5, xmm2  ; c

    ;Calculate s = (a + b + c) / 2
    addsd xmm0, xmm1
    addsd xmm0, xmm2
    divsd xmm0, [two]  ; xmm0 now contains s

    ;Calculate (s-a), (s-b), (s-c)
    movsd xmm1, xmm0
    subsd xmm1, xmm3  ; s-a
    movsd xmm2, xmm0
    subsd xmm2, xmm4  ; s-b
    movsd xmm6, xmm0
    subsd xmm6, xmm5  ; s-c

    ;Calculate product
    mulsd xmm0, xmm1  ; s * (s-a)
    mulsd xmm0, xmm2  ; * (s-b)
    mulsd xmm0, xmm6  ; * (s-c)


    ;Calculate square root
    sqrtsd xmm0, xmm0

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
    leave
    ret
