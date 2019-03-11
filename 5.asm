extern fclose
extern fopen
extern fread
extern memset
extern printf

%define NUM1 20
%define NUM2 1

section .rodata
    error         : db "Cannot open file! Exiting!", 10, 0
    open_mode     : db "r", 0
    output_format : db "%s", 0
    usage         : db "Usage: %s file", 10, 0

section .bss
    buffer : resb NUM1 + 1
    fn     : resd 1
    fh     : resd 1

section .text
    global main

    main:
        push ebp
        mov ebp, esp

        mov edi, DWORD [ebp + 8]
        mov esi, DWORD [ebp + 12]

        cmp edi, 2
        jne .label1

        mov eax, [esi + 4]
        mov DWORD [fn], eax

        push open_mode
        push DWORD [fn]
        call fopen
        add esp, 8
        test eax, eax
        jz .label2

        mov [fh], eax

        push NUM1
        push 0
        push buffer
        call memset
        add esp, 12

        push DWORD [fh]
        push NUM1
        push NUM2
        push buffer
        call fread
        add esp, 16
        mov BYTE [buffer + NUM1], 0

        push buffer
        push output_format
        call printf
        add esp, 8

        push DWORD [fh]
        call fclose
        add esp, 4
        mov eax, 0
        jmp .label3

        .label1:
            push DWORD [esi]
            push usage
            call printf
            add esp, 8
            mov eax, 0
            jmp .label3

        .label2:
            push error
            call printf
            add esp, 4
            mov eax, 1
            jmp .label3

        .label3:
            leave
            ret
