; program to print blank diamond shape

section .data
	msg db "Enter Number of rows to draw star pattern : ",10,0
	format db "%d",0
	star db "* ",0
	blank db "  ",0
	next db " ",10,0

section .bss
	i resd 1
	temp resd 1
	temp1 resd 1
section .text
	global main
	extern printf,puts,scanf
main:
	push msg
	call printf
	add esp,4

	push i
	push format
	call scanf
	add esp,8
	
	mov ebx,2
	mov eax,dword[i]
	inc eax
	xor edx,edx
	div ebx
	inc eax
	mov dword[temp],eax
	sub eax,2
	mov dword[temp1],eax

	mov esi,1 	;works as i variable
	mov edi,1	; works as j variable
	mov ebx,0	; works as k
	
lp1:	mov eax,dword[i]
	inc eax

	cmp esi,eax
	jz out
	
	cmp esi,dword[temp]
	jge do
	inc ebx
	jmp lp

do:	dec ebx	

lp:	mov eax,dword[i]
	inc eax

	cmp edi,eax
	jz out1

	mov ecx,dword[temp]
	mov edx,dword[temp1]
	sub ecx,ebx
	add edx,ebx

	dec ecx
	inc edx
	
	cmp edi,ecx
	jle do1
	cmp edi,edx
	jge do1

	push blank
	call printf
	add esp,4
	inc edi
	jmp lp


do1:	push star
	call printf
	add esp,4
	inc edi
	jmp lp

out1:	push next
	call printf
	add esp,4

	inc esi
	mov edi,1
	jmp lp1

out: 	ret
