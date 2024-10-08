section .data
	msg db "factorial of 5 is %d",10
section .text
	global abc
	extern printf
abc:
	push ebp
	mov ebp,esp

	mov ebx,dword[ebp+8]
	mov eax,dword[ebp+12]
	
lp:	mul ebx
	dec ebx 
	cmp ebx,1
	jnz lp
	push eax
	push msg
	call printf
	add esp,8
	mov eax,0

	mov esp,ebp
	pop ebp

	ret	
