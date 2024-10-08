; program to get maximum from given array

section .data
	msg db "Enter size of array : ",10,0
	msg1 db "Enter number : ",10,0
	format db "%d",0
	msg2 db "max element from given array is : %d",10,0

section .bss
	inp resd 1
	array resd 100

section .text
	global main
	extern printf,scanf
main:
	push msg
	call printf
	add esp,4
	
	push inp 
	push format
	call scanf
	add esp,8
	
	mov edi,array
	mov ebx,dword[inp]
lp:	cmp ebx,0
	jz out

	push msg1
	call printf
	add esp,4

	push edi
	push format
	call scanf
	add esp,8
	add edi,4
	dec ebx
	jmp lp
	
out: 	mov edi,array
	mov ebx,0
	
	
	mov esi,dword[inp]
lp1:	cmp esi,0
	jz end1
	
	cmp ebx,dword[edi]
	jge out1
	
	mov ebx,dword[edi]
	
out1:	add edi,4
	dec esi	
	jmp lp1

end1:	push ebx
	push msg2	
	call printf
	add esp,8

	ret
