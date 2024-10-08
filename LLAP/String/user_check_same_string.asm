section .data
	string1 db "Hello Sir"
	len equ $- string1
	msg db "Enter string : ",10,0	
	msg1 db "you entered correct string",10,0
	msg2 db "you entered wrong string",10,0

section .bss
	string2 resb 100

section .text
	global main
	extern printf,puts,gets
main:
	push msg
	call printf
	add esp,4

	push string2
	call gets
	add esp,4

	mov edx,0
	mov esi,string2
lp:	cmp byte[esi],0
	jz go
	inc edx
	inc esi
	jmp lp	

go:	mov ecx,len
	cmp ecx,edx
	jnz out

	mov esi,string1
	mov edi,string2
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
