%macro cube 1
	mov edi,%1
	mov eax,%1
	mov ebx,2
%%y:	cmp ebx,0
	jz %%z
	mul edi
	dec ebx
	jmp %%y
	
%%z:

%endmacro

section .data
	i dd 153
	msg db "Yes 153 is Armstrong number",10,0
	msg1 db "NO 153 is not Armstrong number",10,0

section .bss
section .text
	global main
	extern printf
main:
	mov eax,dword[i]
	mov edi,10

	xor edx,edx
	div edi
	mov ecx,edx

	xor edx,edx
	div edi
	mov esi,edx
	
	xor edx,edx
	div edi
	mov edi,edx

	cube ecx
	mov ecx,eax
	cube esi
	add ecx,eax
	add ecx,1

	cmp ecx,dword[i]
	jnz out
	
	push msg
	call printf
	add esp,4
	jmp exit

out:	push msg1
	call printf
	add esp,4
	
exit:	ret	
	
