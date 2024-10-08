section .data
	num1 dd 0
	num2 dd 1

section .bss
section .text
	global main
	extern printf,addition
main:
	push dword[num1]
	push dword[num2]
	call addition
	add esp , 8
	ret
