section .text
	global main
	extern pqr
main:
	mov eax,20
	mov ebx,30
	push eax
	push ebx
	call pqr
	add esp,8
	ret
