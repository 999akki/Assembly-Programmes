section .data
	msg db "Enter the first number",10,0
	msg1 db "Enter the second number",10,0
	msg2 db "The sum is %d",10,0
	msg3 db "The sum is %d",10,0
	format db "%d",0
	sum dd 69
	vaja dd 6 
section .bss
	a resd 1
	b resd 1
section .text
	global main
	extern printf, scanf
main:
	push msg
	call printf
	add esp, 4
	
	push a
	push format
	call scanf
	add esp, 8

	push msg1
	call printf
	add esp, 4
	
	push b
	push format
	call scanf
	add esp, 8

	mov ebx, dword[a]
	add ebx, dword[b]
	sub ebx, dword[b]
	mov dword[vaja],ecx
	mov dword[sum],ebx
	push dword[sum] 
	push msg2 
	call printf
	add esp, 8

	push dword[vaja]
	push msg3
	call printf
	add esp, 8

ret	
