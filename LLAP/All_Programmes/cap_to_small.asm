;program to convert small letter to capital letter and vise versa

section .data
	msg db "Low leVel proGRAMMING",10,0
	len equ $-msg 
section .bss
	string resb len
section .text
	global main 
	extern printf
main:

	mov esi,msg
	mov edi,string
q:	xor eax,eax
	mov al,byte[esi]
	cmp al, 10
	jz endl
	cmp al,' '
	jz p
	cmp al,91
	jb addme
	sub al,32
	jmp p
addme:	add al,32
p:	mov byte[edi],al
	inc esi
	inc edi
	jmp q
endl:
	mov eax,4
	mov ebx,1
	mov ecx,string
	mov edx,len
	int 0x80

	ret	
