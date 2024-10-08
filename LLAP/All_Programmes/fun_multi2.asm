section .data
;	msg db "Multiplication table of 2 is : ",10
	msg1 db "%d",10
section .text
	global xyz
	extern printf
xyz:
	push ebp
	mov ebp,esp
	
	mov ebx,dword[ebp+8]
	mov eax,dword[ebp+12]
	
	mov edi,eax
		
lp:	mov eax,edi
	mul ebx
	push eax
	push msg1
	call printf
	add esp,8
	mov eax,0
	
	inc ebx
	cmp ebx,11
	jnz lp

	mov esp,ebp
	pop ebp
	ret
