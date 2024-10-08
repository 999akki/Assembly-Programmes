section .data
	msg db "Enter string : ",10,0
	msg1 db "User String is :",10,0
	msg2 db "Reverse of given  String is :",10,0
	format db "%s"
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

	push msg1
	call printf
	add esp,4

	push string
	call puts
	add esp,4

	push msg2
	call printf
	add esp,4


	mov ecx,0
	mov esi,string
lp1:	mov al,byte[esi]
	cmp al,0
	jz go
	inc ecx
	inc esi
	jmp lp1

go:	mov esi,string	
	add esi,ecx
	dec esi
	mov edi,string1
lp:	std
	lodsb
	cld
	stosb
	loop lp

	push string1
	call puts
	add esp,4

	leave

	ret
	
	
