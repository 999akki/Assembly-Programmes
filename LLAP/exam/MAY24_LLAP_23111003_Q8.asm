; program to calculate floating value of given summation

section .data
	n dd 3
	msg1 db "Summation of given floating point program is : %f",10,0
	x dd 5
	y dd 4

section .bss
	
	deno resd 1
	sum resq 1

section .text
	global main
	extern printf,scanf,puts
main:
	
	fldz
	fstp dword[sum]

	mov esi,dword[n]
	inc esi
	mov ebx,1
lp:	cmp ebx,esi
	jz end
	mov eax,dword[y]
	mul ebx
	
	mov dword[deno],eax
	fild dword[deno]
	fild dword[x]
	fdiv st1
	fadd qword[sum]
	fstp qword[sum]

	inc ebx
	jmp lp
		
end:	fld qword[sum]
	sub esp,16
	fstp qword[esp]
	push msg1
	call printf
	add esp,20
	
	ret
