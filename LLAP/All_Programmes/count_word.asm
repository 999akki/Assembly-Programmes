section .data
	msg db "he i name i aks i hay i he i llo i akshay",10,0
	result db "count is : %d",10,0
	
section .bss
section .text
	global main
	extern printf
main:
	push msg
	call printf
	add esp,4
	mov esi,0
	mov ebx,msg
lp:	cmp byte[ebx],0
	jz out
	cmp byte[ebx]," "
	jnz next
	inc ebx
	cmp byte[ebx],"i"
	jnz next
	inc ebx
	cmp byte[ebx]," "
	jz next1
next:	inc ebx
	jmp lp
next1: 	inc esi
	inc ebx
	jmp lp
out:	push esi
	push result
	call printf
	add esp,8
	ret
	
