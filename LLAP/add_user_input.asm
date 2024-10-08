section .data
	msg1 db "Enter first number",10,0
	format db "%d",0
	msg2 db "Enter second number",10,0
	msg3 db "Addition is : %d",10,0
section .bss
	save resd 1
	save1 resd 1
section .text
	global main
	extern printf
	extern scanf
main:
	push msg1
	call printf
	add esp,4
	push save
	push format
	call scanf
	add esp,8
	push msg2
	call printf
	add esp,4
	push save1
	push format
	call scanf
	add esp,8
	mov eax,dword[save]
	add eax,dword[save1]
	push eax
	push msg3
	call printf
	add esp,8 
	ret
