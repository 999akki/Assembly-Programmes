section .data
	msg db "Enter Value for i=j is :  ",10,0
	format db "%d",0
	m dd 4
	k dd 2
	msg1 db "Solution for given complex summation is : %f",10,0
section .bss
	sum resq 1
	n resd 1
	deno resd 1
	nume resd 1
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

lp2:	mov esi,ecx
	mov dword[nume],ecx
	mov eax,ecx

lp:	dec esi
	cmp esi,0
	jz lp1
	mul esi
	jmp lp
		
lp1:	mov dword[deno],eax
	mov edi,dword[k]
	mul edi

	add dword[deno],eax 	 ; got denominator value here

	mov ebx,dword[m]
	mov eax,dword[nume]
	mul ebx
	add dword[nume],eax	 ; got numerator value

	fild dword[deno]
	fild dword[nume]
	fsqrt
	fdiv st1
	fadd qword[sum]
	fstp qword[sum]
	loop lp2
	
	fld qword[sum]
	sub esp,16
	fstp qword[esp]
	push msg1
	call printf
	add esp,20

	ret
	
	
	
	
	
		
	
	
