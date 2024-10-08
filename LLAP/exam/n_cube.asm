section .data
	msg db "Enter number upto cube wants : ",10,0
	format db "%d",0
	res db "%d",10,0
section .bss
	inp resd 1

section .text
	global main
	extern printf,scanf,puts
main:
	push msg
	call printf
	add esp,4

	push inp
	push format
	call scanf
	add esp,8

	add dword[inp],1

	mov esi,0
lp:	inc esi
	cmp esi,dword[inp]
	jz end

	mov ecx,esi
	mov eax,ecx

	mov ebx,0	
lp1:	inc ebx
	cmp ebx,3
	jz out

	
	mul ecx
	jmp lp1
	
out:	push eax
	push res
	call printf
	add esp,8
	jmp lp

end:	ret
	
	
