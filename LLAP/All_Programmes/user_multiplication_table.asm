section .data
	input db "Enter Number : ",10,0
	format db "%d",0
	input1 dd 1
	msg db "Multiplication table of %d is :",10,0
	msg1 db "%d *  ",0
	msg2 db "%d = ",0
	msg3 db "%d",10,0
	
section .bss
	save resd 1
section .text
	global main
	extern printf,scanf
main:
	push input
	call printf
	add esp,4

	push save
	push format
	call scanf
	add esp,8

	push dword[save]
	push msg
	call printf
	add esp,8

lp:	push dword[save]
	push msg1
	call printf
	add esp,8

	push dword[input1]
	push msg2
	call printf
	add esp,8

	mov eax,dword[save]
	mul dword[input1]
	push eax
	push msg3
	call printf
	add esp,8

	inc dword[input1]
	cmp dword[input1],11
	jz out
	jmp lp

out:	ret
