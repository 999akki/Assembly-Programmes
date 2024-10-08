section .data
	msg db "%d",0
	msg1 db "Addition of factorial is %f",10,0
	
section .bss
	sum resq 1
	fact resd 1
	n resd 1
section .text
	global main
	extern printf,scanf
main:
	fldz
	fstp dword[sum]

	push n
	push msg
	call scanf
	add esp,8

	mov ecx,dword[n]
lp1:	mov esi,ecx

	mov eax,esi
	

lp:	
	dec esi
	cmp esi,0
	jz lp2
	mul esi
	jmp lp
	 

lp2:    mov dword[fact],eax
	fild dword[fact]
	fld1
	fdiv st1
	fadd qword[sum]
	fstp qword[sum]
	loop lp1	
	
	fld qword[sum]
	sub esp,16
	fstp qword[esp]
	push msg1
	call printf
	add esp,20

	ret
