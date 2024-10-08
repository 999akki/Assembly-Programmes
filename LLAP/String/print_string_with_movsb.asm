section .data
	msg db "We are learning how to print string using movsb and rep",0
	len equ $- msg
	msg1 db "Given String is : ",10,0
	
section .bss
	string resb 100

section .text
	global main
	extern printf,puts
main:
	push msg1
	call printf
	add esp,4

	mov ecx,len
	mov esi,msg
	mov edi,string
	
	repne movsb

	push string
	call puts
	add esp,4

	ret
	
