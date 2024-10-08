%macro fact 1
	mov eax, %1
	mov ecx, %1
 %%y:	dec ecx
	mul ecx
	cmp ecx,1
	jz %%z
	jmp %%y
%%z:
%endmacro

section .data
	i dd 1745
	msg db "It is Strong Number",10,0
	msg1 db "It is not strong number",10,0
section .bss
section .text
	global main
	extern printf,puts
main:

	mov eax,dword[i]
	mov ebx,10
	xor edx,edx
	div ebx
	mov esi,edx
	
	xor edx,edx
	div ebx
	mov edi,edx
	
	xor edx,edx
	div ebx
	mov ebx,edx

	
	fact esi
	mov esi,eax
	fact edi
	add esi,eax
	add esi,ebx

	cmp esi,dword[i]	
	jz out
	
	push msg1
	call printf
	add esp,4
	jmp exit
	
out:	push msg
	call printf
	add esp,4

exit:	ret
	
