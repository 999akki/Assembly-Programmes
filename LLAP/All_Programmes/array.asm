section .data
	arr dd 2,4,3,6,9,-1
	msg db "array is : %d",10,0
section .bss
section .text
	global main
	extern printf
main:   mov eax,0
	mul 4
	add eax,dword[arr]
lp:	mov eax, dword[arr]
	push eax
	push msg
	call printf
	add esp,8
	add eax,4
	cmp dword[arr],1
	jz out
	jmp lp
out:	ret
	
