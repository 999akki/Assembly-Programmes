section .data
	
	msg db "Enter Number : ",10,0
	format db "%d",0
	msg1 db "Sum is %f",10,0
	
section .bss
	sqr resd 1
	sum resq 1
	n resd 1

section .text
	global main
	extern printf,scanf
main:
	fldz
	fstp dword[sum]

	push msg
	call printf
	add esp,4
	
	push n
	push format
	call scanf 
	add esp,8

	mov ecx,dword[n]
lp:	mov eax,ecx
	mul ecx
	
	mov dword[sqr],eax
	fild dword[sqr]
	fld1
	fdiv st1
	fadd qword[sum]
	fstp qword[sum]
	loop lp	
	
	fld qword[sum]
	sub esp,16
	fstp qword[esp]
	push msg1
	call printf
	add esp,20

	ret
