; program to find square root of number

section .data
	msg db "Enter Number ",10,0
	format db "%d",0
	msg1 db "square root of given number is : %f",10,0

section .bss
	res resq 1
	n resd 1
section .text
	global main
	extern printf,scanf
main:
	fldz
	fstp dword[res]

	push msg
	call printf
	add esp,4
	
	push n
	push format
	call scanf
	add esp,8	
	
	fild dword[n]
	fsqrt 
	fadd qword[res]
	
	fstp qword[res]
	fld qword[res]
	sub esp,16
	fstp qword[esp]
	push msg1
	call printf
	add esp,20

	ret	
	
	
