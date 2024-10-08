section .data
	msg db "Hello LLAP"
	len equ $- msg
	
section .bss
	
section .text
	global main
	extern printf,rev
main:
	enter 0,0
	
	push msg
	push len
	call rev
	add esp,8
	
	leave 
	ret
	
	
