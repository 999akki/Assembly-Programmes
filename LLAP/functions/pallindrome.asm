section .data
	msg db "pallindrome",10,0
	msg1 db "not pallindrome",10,0
section .bss
	string2 resb 100
section .text
	global pallindrome:function
	extern printf,scanf,gets
pallindrome:
	enter 4,0
	
	mov esi,dword[ebp+8]
	mov ebx,esi
	
	mov ecx,0
lp:	cmp byte[esi],0
	jz go
	inc ecx
	inc esi
	jmp lp

go:
	mov edx,ecx
	mov esi,ebx
	add esi,ecx
	dec esi
	mov edi,string2
lp1:	std
	lodsb
	cld
	stosb
	loop lp1
	
	mov ecx,edx
	mov esi,ebx
	mov edi,string2
	repe cmpsb
	cmp ecx,0
	jnz out

	push msg
	call printf
	add esp,4
	jmp end

out:	push msg1
	call printf
	add esp,4

end:	leave
	ret
