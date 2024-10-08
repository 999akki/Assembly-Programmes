section .data
	msg db "Hello My name is Akshay Dhamane",0
	len equ $- msg
	msg1 db "String is : ",10,0
section .bss
	string resb 100
section .text
	global main
	extern printf,scanf,puts
main:
	push msg1
	call printf
	add esp,4

	mov ecx,len
	mov esi,msg
	mov edi,string
lp:	lodsb
	stosb
	loop lp
	
	push string
	call puts
	add esp,4

	ret
	
	
