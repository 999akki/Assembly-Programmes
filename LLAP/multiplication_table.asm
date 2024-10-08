section .data
	input dd 5 
	input1 dd 1
	msg db "5 * %d =  ",0
	msg1 db "%d",10,0
section .bss
section .text
	global main
	extern printf
main:
lp:	push dword[input1]
	push msg
	call printf
	add esp,8
	mov eax,dword[input]
	mul dword[input1]
	push eax
       	push msg1
	call printf
	add esp,8
	inc dword[input1]
	cmp dword[input1],11
	jz out
	jmp lp
out:	ret
