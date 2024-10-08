section .data
	msg db "Enter value for n : ",10,0
	msg1 db "Enter value for m : ",10,0
	format db "%d",0
	msg3 db "value after summation is : %f",10,0

section .bss
	n resd 1
	m resd 1
	sum resq 1
	num resd 1
	deno resd 1

section .text
	global main
	extern printf,scanf,puts
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

	push msg1
	call printf
	add esp,4

	push m
	push format
	call scanf
	add esp,8

	mov ebx,dword[n]
	inc ebx
	mov esi,0
lp:	mov ecx,2
	

	
	inc esi
	cmp esi,ebx
	jz out
	mov eax,esi
	add eax,dword[m]
	
	mov dword[num],ecx
	mov dword[deno],eax

	fild dword[deno]
	fild dword[num]
	fdiv st1
	fadd qword[sum]
	fstp qword[sum]
	jmp lp
	
out:	fld qword[sum]
	sub esp,16
	fstp qword[esp]
	push msg3
	call printf
	add esp,20

	ret
