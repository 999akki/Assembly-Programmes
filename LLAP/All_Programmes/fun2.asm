section .text
	global main
	extern abc
main:
	mov eax,5
	mov ebx,4
	push eax
	push ebx
	call abc
	add esp,8
	ret
