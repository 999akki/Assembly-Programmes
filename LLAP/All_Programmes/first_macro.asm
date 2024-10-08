
;User defined Multiplication table

%macro multi 1

	push msg
	call printf
	add esp,4
		
	push save
	push format
	call scanf
	add esp,8

	push %1
	push msg3
	call printf
	add esp,8

	mov esi,0
%%lp:	inc esi
	cmp esi,11
	jz %%out
	push %1
	push msg1
	call printf
	add esp,8
	push esi
	push msg2
	call printf
	add esp,8
	mov eax,%1
	mul esi
	push eax
	push format1
	call printf
	add esp,8
	jmp %%lp	

%%out:

%endmacro

section .data
	msg db "Enter Number : ",10,0
	msg3 db "Multiplication table of %d is : ",10,0
	format db "%d",0
	msg1 db "%d * ",0
	msg2 db "%d = ",0
	format1 db "%d",10,0	
section .bss
	save resd 1

section .text
	global main
	extern printf,scanf
main:
	multi dword[save]

	ret
