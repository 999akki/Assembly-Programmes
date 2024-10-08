section .data
	number db 32,3,43,4,-1
        msg db "Addition is %d",10,0
section .bss
	sum resd 1

section .text
	global main
	extern printf
	
main:
	mov dword[sum],0
	mov ecx,0
lp:	mov eax,4
	mov esi,number
	xor edx,edx
	mul ecx
	add esi,eax
	cmp dword[esi],-1
	jz endp
	mov ebx,dword[esi]
	add dword[sum],ebx
	inc ecx
	jmp lp
endp:
	push dword[sum]
	push msg
	call printf
	add esp,8
	ret
