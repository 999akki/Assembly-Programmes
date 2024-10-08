section .data
	pi dq 3.14
	r dd 4
section .bss
section .text
	global main
main:
	fild dword[r]
	fmul st0,st0
	fld qword[pi]
	fmul st0,st1
	ret

