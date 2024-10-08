section .data
	msg db "Enter string : ",10,0
	format db "%d",0
	msg1 db "reverse of string in capital letter is : ",10,0

section .bss
	string resb 100
	string1 resb 100

section .text
	global main
	extern printf,scanf,puts,gets
main:
	enter 0,0

	push msg
	call printf
	add esp,4
	
	push string 
	call gets
	add esp,4

	mov esi,string
	mov ecx,0
lp:	cmp byte[esi],0
	jz out
	inc ecx
	sub byte[esi],32
	inc esi
	jmp lp
	
out:	mov esi,string
	add esi,ecx
	dec esi
	mov edi,string1
lp1:	std
	lodsb
	cld	
	stosb
	loop lp1	

	push msg1
	call printf
	add esp,4

	push string1
	call puts
	add esp,4

	leave
	ret	
	
	
