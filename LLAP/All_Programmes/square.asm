section .data
	msg db "x^2 - x is  %d ",10,0
section .bss
section .text
	global square
	extern printf
square: enter 4,0
	mov eax,dword[ebp+8]
	mov dword[ebp-4],eax
	mul eax
	sub eax,dword[ebp-4]
	push eax
	push msg
	call printf
	add esp,8
	leave
	ret
