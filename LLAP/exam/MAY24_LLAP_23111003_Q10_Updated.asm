; program to get maximum from given array

section .data
	
	array dd 2,4,5,1
	msg2 db "max element from given array is : %d",10,0
	size dd 4
	
section .bss
	
section .text
	global main
	extern printf,scanf
main:
	mov esi,array
	mov ebx,0
	mov ecx,dword[size]
	dec ecx	
lp:	cmp ebx,dword[esi]
	jl out
	add esi,4
	loop lp
	jmp endp
	
out:	mov ebx,dword[esi]
	add esi,4
	loop lp

endp:	push ebx
	push msg2
	call printf
	add esp,8

	ret
