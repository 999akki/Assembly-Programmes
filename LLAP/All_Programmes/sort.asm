section .data
	arr dd 5,4,3,2,1,-1
	msg db "%d",0
	si dd 5
section .bss
	sorted resd 6
section .text
	global main
	extern printf
main:
	mov ebx,0    
lp:	mov eax,ebx
	mov edi,dword[si]
	mul dword[sizeOfInt]
	add eax,arr
	cmp dword[eax] ,-1 
	jz out
pusha
	mov esi,1
	cmp esi,edi
	jz next
	mov ecx,dword[eax]
out:	ret 
