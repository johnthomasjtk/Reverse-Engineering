BITS 32
extern printf
extern scanf

scanf %d, num

SECTION .data  ;initialised data
msg: db "This is my message"10,0
input : "%d"
go: db "enter a number"
SECTION .bss
num: resd 1

SECTION .text  ;code
    global main

    main:
        push ebp
        mov ebp, esp


	push num
	push input
	call scanf
	add esp,8    

	push go
	call printf
	add esp,4

	
	
    push msg	
    call printf
	
    xor eax, eax
    leave
     ret



