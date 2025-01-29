extern printf
extern scanf
extern heron
global manager


section .data
    prompt_fmt db "Please enter 3 float numbers separated by white space.", 10, 0
    result_fmt db "The area of this triangle is %f square units", 10, 0
    input_fmt db "%f %f %f", 0

section .bss
    side1 resq 1
    side2 resq 1
    side3 resq 1
    area resq 1

section .text

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

    ;output prompt
    mov rdi, prompt_fmt
    xor rax, rax
    call printf

    ; input three sides
    mov rdi, input_fmt
    mov rsi, side1
    mov rdx, side2
    mov rcx, side3
    xor rax, rax
    call scanf

    ; Call heron
    movsd xmm0, [side1]
    movsd xmm1, [side2]
    movsd xmm2, [side3]
    call heron
    movsd [area], xmm0

    ;ourput result
    mov rdi, result_fmt
    movsd xmm0, [area]
    mov rax, 1
    call printf

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
