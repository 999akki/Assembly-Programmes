section .data
	msg1 db "Enter first number",10,0
	msg2 db "Enter second number",10,0
	msg3 db "Addition is : %d",10,0
	format db "%d",0

section .bss
	num1 resd 1
	num2 resd 1
	result resd 1

section .text
	global main
	extern scanf,printf,add
main:
	enter 0,0

	push msg1
	call printf
	add esp,4

	push num1
	push format
	call scanf
	add esp,8

	push msg2
	call printf
	add esp,4

	push num2
	push format
	call scanf
	add esp,8

	push dword[num1]
	push dword[num2]
	push result
	call add
	add esp,12

	push dword[result]
	push msg3
	call printf
	add esp,8

	leave
	ret


		
