section .data
	msg db " %d ",0

section .text
	global addition
	extern printf

addition: enter 4, 0

	mov esi, dword[ebp+12]
	mov dword[ebp-4],esi
	push dword[ebp-4]
	push msg
	call printf
	add esp,8
	
	mov edi,dword[ebp+8]
	push edi
	push msg
	call printf
	add esp,8

	mov ecx,8
	mov ebx,0
lp:	dec ecx
	cmp ecx,0
	jz out
	add dword[ebp-4],edi
	pusha
	push dword[ebp-4]
	push msg
	call printf
	add esp,8
	popa
	mov ebx,dword[ebp-4]
	mov dword[ebp-4],edi
	mov edi,ebx
	jmp lp	

out:	leave 
	ret

