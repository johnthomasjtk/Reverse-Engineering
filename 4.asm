extern printf
extern scanf

section .rodata
    inp  :    db "%d", 0
    grt  :    db "%d", 10, 0
    equ  :    db "Same", 10, 0
    p1   :    db "Enter first number: ", 0
    p2   :    db "Enter second number: ", 0

section .bss
    num1: resd 1
    num2: resd 1

section .text
    global main

    main:
        push ebp
        mov ebp, esp

        push p1
        call printf
        add esp, 4

        push num1
        push inp
        call scanf
        add esp, 8

        push p2
        call printf
        add esp, 4

        push num2
        push inp
        call scanf
        add esp, 8

        mov eax, DWORD [num1]
        cmp eax, DWORD [num2]
        jg .label1
        jl .label2
        jmp .label3

        .label1:
            push DWORD [num1]
            jmp .label4

        .label2:
            push DWORD [num2]
            jmp .label4

        .label3:
            push equ
            call printf
            add esp, 4
            jmp .label5

        .label4:
            push grt
            call printf
            add esp, 8

        .label5:
            xor eax, eax
            leave
            ret
