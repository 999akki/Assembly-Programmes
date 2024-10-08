section .data
	inp dd 23,12,14,56,27,-1
	msg db "%d",0
section .bss
section .text
	global main
	extern printf,puts
main:
lp:	mov ebx,dword[inp]
	cmp ebx,-1
	jz out
	push ebx
	push msg
	call printf
	add esp,8
	add dword[inp],4
	jmp lp
out:	ret
