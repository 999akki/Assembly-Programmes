section .data
	b dd 10
	a dd 4
	c dd 4
	d dd 4
	e dd 2
	msg db "Solution of quadratic equation is %f",10,0	
section .bss
	sum resq 1
section .text
	global main
	extern printf
main:
	fldz
	fstp dword[sum]

	fild dword[b]
        fmul st0,st0
        fild dword[c]
        fild dword[a]
        fild dword[d]
        fmul st0,st1
        fmul st0,st2
        fchs
        fadd st0,st3
        fsqrt
	fild dword[b]
	fchs
	fadd st0,st1
	fild dword[e]
	fmul st0,st3
	fdivr st0,st1	
	
	fadd qword[sum]
	fstp qword[sum]

	fld qword[sum]
	sub esp,16
	fstp qword[esp]
	push msg
	call printf
	add esp,20

	ret
