section .data
	format db "%s"
	msg db "Enter a string to check",10,0
	msg1 db "pallindrome",10,0
	msg2 db "Not pallindrome",10,0

section .bss
	string1 resb 100
	string2 resb 100

section .text
	global main
	extern printf,puts,scanf,gets
main:
	push msg
	call printf
	add esp,4

	push string1
	call gets
	add esp,4
	
	mov ecx,0
	mov esi,string1
lp:	cmp byte[esi],0
	jz go
	inc ecx
	inc esi
	jmp lp


go:	mov edx,ecx
	mov esi,string1
	add esi,ecx
	dec esi
	mov edi,string2
lp1:	std
	lodsb
	cld
	stosb
	loop lp1
	
	mov ecx,edx
	mov esi,string1
	mov edi,string2
	repe cmpsb
	cmp ecx,0
	jnz out

	push msg1
	call printf
	add esp,4
	jmp end

out:	push msg2
	call printf
	add esp,4

end:	ret				
