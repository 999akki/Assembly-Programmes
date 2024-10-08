section .data
	msg db "Ans is : %f",10,0
	b dq 20.0
	a dq 5.0
	c dq 10.0
	d dq 4.0
section .bss
	ans resq 1
section .text
	global main
	extern printf
main:
	fldz
	fstp dword[ans]
	
	fld qword[b]
	fmul st0,st0
	fld qword[c]
	fld qword[a]
	fld qword[d]
	fmul st0,st1
	fmul st0,st2
	fchs
	fadd st0,st3
	fsqrt 	
	fadd qword[ans]
	fstp qword[ans]
	fld qword[ans]
	sub esp,16
	fstp qword[esp]
	push msg
	call printf
	add esp,20
	
	ret
	
	
	
	

