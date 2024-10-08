section .data
	msg db "this is my country",10,0
	len equ $-msg

section .bss
	dest resb len
	revdest resb len

section .text
	global main
	extern puts

main:	mov esi,msg
	mov ebx,dest

lp:	cmp byte[esi],10
	jz end

	mov edi,esi

	mov ecx,100
	mov edx,ecx

	mov al,' '
	repne scasb
	
	sub edx,ecx
	mov ecx,edx	
	
	mov esi,edi
	sub esi,2
	sub ecx,1
	mov edi,ebx

lp2:	std
	lodsb
	cld 
	stosb
	loop lp2
	
	add esi,edx
	movsb
	mov ebx,edi
	jmp lp


end:	mov esi,dest
	mov edi,revdest
	mov ecx,len
	add esi,len
	sub esi,4
	sub ecx,3

lp1:	std 
	lodsb
	cld
	stosb
	loop lp1



finish:	mov eax,4
	mov ebx,1
	mov ecx,revdest
	mov edx,len
	int 0x80

	ret


