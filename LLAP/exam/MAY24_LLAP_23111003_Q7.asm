; program to Display n numbers which are divisible by 5

section .data
	msg db "Enter N number upto  which divisible by 5",10,0
	format db "%d",0
	msg1 db "%d is Divisible by 5",10,0
	
section .bss
	inp resd 1
	
section .text
	global main
	extern printf,puts,scanf
main:
	push msg
	call printf
	add esp,4
	
	push inp 
	push format
	call scanf
	add esp,8

	mov esi,5
	mov ebx,1
	mov edi,dword[inp]	
	inc edi
	
lp:	cmp ebx,edi
	jz end
	mov eax,ebx
	mul esi

	push eax
	push msg1
	call printf
	add esp,8
	inc ebx
	jmp lp

out:	inc ebx
	jmp lp

end:	ret
