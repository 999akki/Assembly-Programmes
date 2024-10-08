section .data
	string db "Akshay Dhamane",10,0
	len equ $- string
	msg db "string length is : %d",10,0

section .bss
section .text
	global main
	extern printf
main:
	push len
	push msg
	call printf
	add esp,8
	ret
	
