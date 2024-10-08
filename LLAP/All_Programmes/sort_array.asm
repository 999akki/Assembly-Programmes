section .data
	arr dd 2,32,5,34,72,23,-1
	
section .bss
section .text
	global main
	extern printf
main:
	eax,dword[arr]
	mov ecx,arr
loop:	add ecx,4
	mov esi,dword[ecx]
	
	cmp esi,-1
	jz out
	
	cmp eax,esi
	jge loop
	mov eax,esi
	jmp loop
	
	//incomplete
