section .data
	msg1 db "Reverse of given string is : ",10,0
	msg db "Hello"
	len equ $-msg
section .bss
	string resb 100
section .text
	global reverse
	extern printf,puts
reverse:
	enter 0,0
	
	push msg1
	call printf
	add esp,4

	mov ecx,len
	mov edi,string
	mov esi,msg
	add esi,len
	dec esi
lp:	std
	lodsb
	cld
	stosb
	loop lp

	mov edi,string
	push edi	
	call puts
	add esp,4

	leave
	ret
	
	
		
