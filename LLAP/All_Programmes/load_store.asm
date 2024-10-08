section .data
	string db "Hello my name is akshay"
	len equ $-string
section .bss
	string1 resb 1000
section .text
	global main
	extern puts,printf
main: 
	mov ecx,len
	mov edi,string1
	mov esi,string
	add esi,len
	sub esi,1
lp:	std
	lodsb
	cld
	stosb
	loop lp
	push string1
	call puts
	add esp,4
	ret
	
