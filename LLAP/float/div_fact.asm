;we will divide one factorial with another

section .data
	msg db "Enter Number :",10,0
	format db "%d",0
	msg1 db "result is : %f",10,0

section .bss
	n1 resd 1
	n2 resd 1
	res resq 1

section .text
	global main
	extern printf,scanf
main:
;	fldz
;	fstp dword[res]

	push msg
	call printf
	add esp,4	

	push n1
	push format
	call scanf
	add esp,8

	push msg
	call printf
	add esp,4

	push n2
	push format
	call scanf
	add esp,8

	mov ecx,dword[n1]
	mov eax,ecx
lp:	dec ecx
	cmp ecx,0
	jz out
	mul ecx
	jmp lp

out:	mov dword[n1],eax

	mov ecx,dword[n2]
	mov eax,ecx
lp1:	dec ecx
	cmp ecx,0
	jz out1
	mul ecx
	jmp lp1

out1:	mov dword[n2],eax

	fild dword[n2]
	fild dword[n1]
	fdiv st1
	
;	fadd qword[res]
;	fstp qword[res]
;	fld qword[res]
	
	sub esp,16
	fstp qword[esp]
	push msg1
	call printf
	add esp,20

	ret
		
