section .data
section .bss
	string resb 100
section .text
	global rev:function
	extern printf,puts
rev:
	enter 8,0

	mov ecx,dword[ebp+8]   ;ecx = 10
	mov esi,dword[ebp+12]  ; esi = start address

	mov ebx,0

lp:	cmp byte[esi],32
	jz out
	inc ebx
	inc esi
	jmp lp
out:
	sub ecx,ebx
	inc esi
	
	mov edi,string

lp1:	lodsb
	stosb
	loop lp1

	
	push string 
	call puts
	add esp,4

	leave
	ret
