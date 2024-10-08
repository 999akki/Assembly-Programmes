%macro fact 1
	mov eax,%1
	mov ebx,%1
%%b:	dec ebx
	mul ebx
	cmp ebx,1
	jz %%a
	jmp %%b
%%a:

%endmacro

section .data
	msg db "Enter number : ",0
	format db "%d"
	msg1 db "factorial of given number is : %d",10,0
section .bss
	save resb 100
section .text
	global main
	extern printf,scanf
main:
	push msg
	call printf
	add esp,4
	push save
	push format
	call scanf
	add esp,8
	
	fact dword[save]
	
	push eax
	push msg1
	call printf
	add esp,8
	ret
