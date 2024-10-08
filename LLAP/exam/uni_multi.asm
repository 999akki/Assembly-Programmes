%macro multi 1
	
	mov esi,1
%%lp:	cmp esi,11
	jz %%out
	mov eax, %1
	mul esi
	mov edi,eax
	push edi
	push msg2
	call printf
	add esp,8

	mov dword[num1],edi

	fild dword[num1]
	fsqrt
	fstp qword[num1]
	fld qword[num1]
	sub esp,16
	fstp qword[esp]
	push msg3
	call printf
	add esp,20
	
	inc esi
	jmp %%lp
	
%%out:	

%endmacro
section .data
	msg db "Enter Number for multiplication table : ",10,0
	format db "%d",0
	msg1 db "Multiplication table along with respect to its square roots is as follows : ",10,0
	msg4 db "numbers          square root",10,0
	msg2 db "  %d               ",0
	msg3 db "%f",10,0

section .bss
	n resd 1
	num1 resd 1
	display resq 1

section .text
	global main
	extern printf,scanf,puts
main:
	push msg
	call printf
	add esp,4

	push n
	push format
	call scanf
	add esp,8
	
	push msg4
	call printf
	add esp,4
	
	multi dword[n]
	

	


	ret
