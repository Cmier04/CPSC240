;Author: Christine Mier
;Email: cmier@csu.fullerton.edu
;Course/Section: CPSC240-17
;Date: Dec-17-2024

extern printf
extern fgets
extern scanf
extern stdin
extern atol
extern manager
extern input_array
extern output_array
global sort
global sum

segment .data

segment .bss

segment .text
sum:
;16 push
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

;save all int numbers

;back
mov     r14, rdi
mov     r15, rsi        ;r15 = how many
xor     r13, r13        ;r13 = loop counter

xor     r8, r8          ;r8 = accumalater

beginloop:
    ;check if array is full to end loop
    cmp     r13, r15         ;comparing the two to see if you can exit loop
    jge     endloop

    ;add elements in array
    addsd   xmm15, [r14 + r13 * 8]
    inc     r13

    ;repeat loop
    jmp beginloop
endloop:
    push    qword 0
    movsd   [rsp], xmm15
    ;mov     rax, r8        originally placed here by professor
    ;restore sum
    movsd   xmm0, [rsp]
    pop     rax

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