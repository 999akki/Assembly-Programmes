section .data
	msg db "Enter Value : ",10,0
	format db "%d",0
	msg1 db "Summation of complex formula is : %f",10,0
section .bss
	n resd 1
	factij resd 1
	nume resd 1	
	sum resq 1	

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

	mov edi,3

	mov ecx,dword[n]
		
lp2:	mov esi,ecx
	mov eax,ecx

lp:	dec esi
	cmp esi,0
	jz lp1
	mul esi
	jmp lp
	
lp1:	mul edi	
	mov dword[factij],eax
	
	mov eax,ecx
	mul edi
	
	mov dword[nume],eax

	fild dword[factij]
	fild dword[nume]
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
