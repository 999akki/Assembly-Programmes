%macro Multi 1

	mov eax,%1
	mov ebx,%1
	
%%x:	
	cmp ecx,1
	je %%z
	mul ebx
	dec ecx
	jmp %%x
	

%%z:	add esi,eax
	
%endmacro

section .data
	msg2 db "Enter Number : ",10,0
	format db "%d",0
	msg db "Given Number is Armstrong Number",10,0
	msg1 db "Given Number is not Armstrong Number",10,0
section .bss
	n resd 1
	n1 resd 1
section .text
	global main
	extern printf,scanf
main:
	push msg2
	call printf
	add esp,4

	push n
	push format
	call scanf	
	add esp,8

	mov ecx,0
	mov eax,dword[n]
	mov ebx,10
	 	
lp:	xor edx,edx
	div ebx
	inc ecx
	cmp eax,0
	jne lp
	
	mov dword[n1],ecx
	mov esi,0
	mov eax,dword[n]
	
lp1:	mov ebx,10
	xor edx,edx
	div ebx
	mov edi,eax
	Multi edx
	mov ecx,dword[n1]
	mov eax,edi
	cmp eax,0
	jne lp1

	cmp esi,dword[n]
	jnz out
	push msg
	call printf
	add esp,4
	jmp exit

out:	push msg1
	call printf
	add esp,4

exit:   ret	
