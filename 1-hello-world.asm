;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                              ;
; Author    :   Arvind                                                         ;
; Program   :   print "Hello world" using printf                               ;
;                                                                              ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

BITS 32

extern printf                               ; declare that printf is defined elsewhere

section .rodata                             ; start of data section
    hello_world: db "Hello, world!", 10, 0  ; string we wish to print out

section .text                               ; start of text section
    global main                             ; declare main as globally visible

    main:
        push ebp                            ; set up main's stack frame
        mov ebp, esp                        ; on top of it's caller's frame

        push hello_world                    ; set only argument to printf
        call printf                         ; and invoke it.
        add esp, 4                          ; remove argument from stack

        mov eax, 0                          ; set return value
        mov esp, ebp                        ; destroy main's stack frame and
        pop ebp                             ; restore main's caller's stack frame
        ret                                 ; return to main's caller
