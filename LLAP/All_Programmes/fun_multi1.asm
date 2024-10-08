section .text
	global main
	extern xyz
main:
	mov eax,2
	mov ebx,1
	push eax
	push ebx
	call xyz
	add esp,8
	ret
