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
extern input_array
extern output_array
global sort
global sum

segment .data
    one dq 1.0    ; Constant value of 1.0 for division

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

;save array pointer and size
mov     r14, rdi        ; r14 = array pointer
mov     r15, rsi        ; r15 = array size
xor     r13, r13        ; r13 = loop counter

; Initialize xmm15 to 0 for accumulating reciprocals
pxor   xmm15, xmm15    ; Clear xmm15
movsd   xmm14, [rel one]

beginloop:
    ;check if array is full to end loop
    cmp     r13, r15
    jge     endloop

    ; Load current number into xmm0
    movsd   xmm0, [r14 + r13 * 8]
    
    ; Calculate reciprocal (1/x)
    movsd   xmm1, xmm14
    divsd   xmm1, xmm0
    
    ; Add reciprocal to sum
    addsd   xmm15, xmm1
    
    inc     r13
    jmp     beginloop

endloop:
    cvtsi2sd xmm1, r15      ; Convert array size to double
    divsd    xmm1, xmm15    ; Calculate final harmonic mean
    
    ; Store result

    movsd   xmm0, xmm1    ; Put result in xmm0 for return

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
