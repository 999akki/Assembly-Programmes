section .data
	string db "My name is Akshay",0
	res db "String length is : %d",10,0
section .bss
	msg resb 100
section .text
	global main
	extern printf,puts
main:	
	mov al," "
	mov ecx,1000
	mov edx,ecx
	mov edi,string
	repne scasb
	sub edx,ecx
	
	push edx
	push res
	call printf
	add esp,8

	
	ret
