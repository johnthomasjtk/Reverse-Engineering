BITS 32

extern printf
extern scanf

section .data
    i   :    dd 1

section .rodata
    out :    db "%d", 10, 0

section .text
 
        .label1:
            push DWORD [i]
            push out
            call printf
            add esp, 8
            inc DWORD [i]
            cmp DWORD [i], 10
            jg .label2
            jmp .label1

        .label2:
            xor eax, eax
            leave
            ret
