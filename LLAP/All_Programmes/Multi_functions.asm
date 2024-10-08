section .data
	msg db "Multiplication table is : ",10,0
	msg2 db "%d",10,0
section .bss
section .text
	global multi:function
	extern printf
multi:
	enter 4,0

	push msg
	call printf
	add esp,4
	
	mov esi,dword[ebp+8]
	mov dword[ebp-4],esi
	
	mov ebx,0

lp:	mov eax,dword[ebp-4]
	inc ebx
	cmp ebx,11
	jz out
	mul ebx
	push eax
	push msg2
	call printf
	add esp,8
	jmp lp

out:	leave
	ret
