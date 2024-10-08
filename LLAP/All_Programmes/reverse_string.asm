section .data
	msg db "reverse of string is :",10,0
	
section .bss

	string resb 100

section .text
	global reverse:function
	extern printf,puts
reverse:
	enter 8,0

;	push msg
;	call printf
;	add esp,4

	mov ecx,dword[ebp+8]
	mov esi,dword[ebp+12]
	add esi,dword[ebp+8]
	dec esi	
	mov edi,string
lp:	std 
	lodsb
	cld
	stosb
	loop lp
	
	push string
	call puts 
	add esp,4

	leave 
	ret
	
