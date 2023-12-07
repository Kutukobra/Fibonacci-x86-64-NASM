%include "printing.asm"

section .data
    title db "====Fibonacci Sequence====", 10, 0

section .bss

section .text
    global _start

_start:
    printString title
    mov r8, 0
    mov r9, 1

    printUINT r8 ; Print first two digits
    printUINT r9

    mov r10, 10 ; Number of loop
_fibonacci:
    push r9
    add r9, r8
    pop r8
    printUINT r9
    dec r10
    test r10, r10
    jnz _fibonacci
    
    mov rax, 0x3C
    mov rdi, 0
    syscall