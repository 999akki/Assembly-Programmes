section .data
	msg db "Akshay",0
	len equ $-msg
	msg1 db "Akshay",0
	res1 db "equal",0
	res2 db "unequal",0
section .bss

section .text
	global main
	extern printf,puts
main:
	mov al,0
	mov ecx,len
	mov esi,msg
	mov edi,msg1
	repe cmpsb
	cmp ecx,0
	jnz out1
	
	push res1
	call puts
	add esp,4
	jmp end

out1:	push res2
	call puts
	add esp,4

end: 	ret
