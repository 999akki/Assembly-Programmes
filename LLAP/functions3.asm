section .data
	inp1 dd 8
	num1 dd 0
	num2 dd 1
section .bss
section .text
	global main
	extern multi
main:
	enter 0,0
;	push dword[inp1]
;	call fact
;	add esp,4

	push dword[inp1]
	call multi
	add esp,4
	
;	push dword[num2]
;	push dword[num1]
;	call fibo
;	add esp,8

	leave
	ret
