section .data
	msg db "Enter String",10,0
	msg1 db "Count of words in given string is %d",10,0
	
section .bss
	string resb 100

section .text
	global main
	extern printf,gets,puts
main:
	push msg
	call printf
	add esp,4

	push string 
	call gets
	add esp,4

	mov ecx,0
	mov edi,string
	dec edi
lp:	inc edi
	cmp byte[edi],32
	jnz go
	inc ecx
	jmp lp

go:	cmp byte[edi],0
	jnz lp
	
	inc ecx

	push ecx
	push msg1
	call printf
	add esp,8

	ret	
