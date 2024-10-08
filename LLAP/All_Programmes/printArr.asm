section .data
	arr dd 1,2,3,4,5,6,-1
	msg db "%d ",0
	n dd 4
section .text
	global main
	extern printf
main:
	mov ebx, 0
lp:	mov eax, dword[n]
	mul ebx
	add eax, arr
	cmp dword[eax],-1
	jz out
	push dword[eax]
	push msg
	call printf
	add esp, 8 
	inc ebx
	jmp lp

out:
	ret	
