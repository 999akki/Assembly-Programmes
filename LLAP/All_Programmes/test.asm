section .data
	string db "Hello today is sunday and wednesday",0
	res db "the length of string is : %d",10,0

section .bss
section .text
	global main
	extern printf
main:
	mov al,0
	mov ecx,1000
	mov edx,ecx
	mov edi,string
	repne scasb
	sub edx,ecx
 	pusha	
	push edx
	push res
	call printf
	add esp,8
	popa

	
	mov eax,4
	mov ebx,1
	mov ecx,string
	int 0x80

	mov eax,4
	mov ebx,1
	mov byte[ecx],10
	mov edx,1
	int 0x80
	ret
