section .data
	num1 dd 5
	num2 dd 8
	string db "Addition is : %d",10,0
section .text
	global main
	extern printf
main:
	mov eax,dword[num1]
	mov esi,dword[num2]
	add eax,esi
	push eax
	push string
	call printf
	add esp,8
	ret
	
