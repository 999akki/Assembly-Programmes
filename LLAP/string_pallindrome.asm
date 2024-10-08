section .data
	msg db "LOL OMO LOL"
	len equ $- msg
	msg1 db "Given string is Pallindrome",10,0
	msg2 db "Given string is not Pallindrome",10,0

section .bss
	string resb 100

section .text
	global main	
	extern printf,puts
main:
	mov ecx,len
	mov esi,msg
	mov edi,string
	add esi,len
	dec esi
lp:	std
	lodsb
	cld
	stosb
	loop lp

	mov ecx,len
	mov esi,msg
	mov edi,string
	repe cmpsb
	cmp ecx,0
	jnz out
	
	push msg1
	call printf
	add esp,4
	jmp end

out:	push msg2
	call printf
	add esp,4

end:	ret	
