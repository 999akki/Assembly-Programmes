%macro vowel 1
	mov ecx,len
	mov ebx,0	
	mov edi,%1
%%loop:	cmp ecx,0
	jz %%out
	
	cmp byte[edi],"A"
	jz %%lp
	cmp byte[edi],"E"
	jz %%lp
	cmp byte[edi],"I"
	jz %%lp
	cmp byte[edi],"O"
	jz %%lp
	cmp byte[edi],"U"
	jz %%lp
	cmp byte[edi],"a"
	jz %%lp
	cmp byte[edi],"e"
	jz %%lp
	cmp byte[edi],"i"
	jz %%lp
	cmp byte[edi],"o"
	jz %%lp
	cmp byte[edi],"u"
	jz %%lp
	
	inc edi
	dec ecx
	jmp %%loop

%%lp:	inc ebx
	inc edi
	dec ecx
	jmp %%loop

%%out:	push ebx
	push res
	call printf
	add esp,8
	
%endmacro

section .data
	string db "Hello my name is Akshay Dhamane",10,0
	len equ $-string
	res db "The number of vowel in given string are : %d",10,0
section .bss
section .text
	global main
	extern printf,puts
main:	
	vowel string
	ret
