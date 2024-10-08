section .data
	num1 dd 10
section .text
	global main
	extern printf,square
main:
	push dword[num1]
	call square
	add esp,4
	ret
