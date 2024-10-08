section .data	
	msg db "Value is %d",10
section .text
	global pqr
	extern printf
pqr:
	push ebp
	mov ebp,esp
	
	mov ebx,dword[ebp+8]
	mov eax,dword[ebp+12]
	
	mul ebx
	push eax
	push msg
	call printf
	add esp,8
	mov eax,0	

	mov esp,ebp
	pop ebp
	
	ret
