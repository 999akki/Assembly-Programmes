section .data
	string db "My name i Akshay i studding i computer science",10
	       db "Hello i where i never akkk i never i akshay i",10,0
	msg db "Word Count of i word is: %d",10,0

section .text
	global main
	extern printf
main:
	xor ecx,ecx
	mov esi,string
lp:	cmp byte[esi],0
	jz endl
	cmp byte[esi]," "
	jnz skip
	inc esi
skip1:	cmp byte[esi],"i"
	jnz skip
	inc esi
	cmp byte[esi]," "
	jnz skip
	inc esi
	cmp byte[esi],10
	jz skip
skip2:	inc ecx
	inc esi 	
	cmp byte[esi]," "
	jnz skip
	inc esi
	cmp byte[esi],"i"
	jnz skip
	inc esi
	cmp byte[esi],10
	jnz skip 
	inc ecx
skip:	inc esi
	jmp lp
endl:
	push ecx
	push msg
	call printf
	add esp,8
	ret
	
