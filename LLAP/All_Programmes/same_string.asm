section .data
	msg db "Akshay"
	len equ $-msg
	msg1 db "Akshay"
	res1 db "string are same",0
	res2 db "string are not same",0
section .bss
	check resb1 100
section .text
	global main
	extern puts
main:
	mov ecx,len
	mov edi,check	
	mov esi,
