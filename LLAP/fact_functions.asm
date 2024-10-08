section .data
	msg db "factorial of given number is : %d",10,0
section .bss
section .text
	global fact:function
	extern printf
fact:	
	enter 4,0

	mov esi,dword[ebp+8]
	mov dword[ebp-4],esi    ;----------here we are using local variable as dword[ebp-4]  and they  start from -4 go upto their limit
	mov eax, dword[ebp-4]
	mov ecx, dword[ebp-4]

lp:	dec ecx
	cmp ecx,1
	jz out
	mul ecx
	jmp lp	

out:    push eax
	push msg
	call printf
	add esp,8

	leave
	ret
	
	
