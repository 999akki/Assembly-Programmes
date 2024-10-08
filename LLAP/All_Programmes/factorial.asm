section .data
	input db "Enter number : ",10,0
	format db "%d",0
	input1 db "Factorial of number %d is : ",0
	input3 db "%d",10,0
	
section .bss
	save resd 1
	
section .text
	global main
	extern printf,scanf
main:	
	push input
	call printf
	add esp,4
	push save
	push format
	call scanf
	add esp,8
	push dword[save]
	push input1
	call printf
	add esp,8
	mov eax,dword[save]
lp:	dec dword[save]
	mul dword[save]
	cmp dword[save],1
	jz out
	jmp lp
out:	push eax
	push input3
	call printf
	add esp,8
	ret

