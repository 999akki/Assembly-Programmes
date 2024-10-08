%macro vowel 1

	mov esi,%1
	mov ebx,0

%%lp:	cmp byte[esi],0
	jz %%end
	cmp byte[esi],'A'
	jz %%out
	cmp byte[esi],'E'
	jz %%out
	cmp byte[esi],'I'
	jz %%out
	cmp byte[esi],'O'
	jz %%out
	cmp byte[esi],'U'
	jz %%out
	cmp byte[esi],'a'
	jz %%out
	cmp byte[esi],'e'
	jz %%out
	cmp byte[esi],'i'
	jz %%out
	cmp byte[esi],'o'
	jz %%out
	cmp byte[esi],'u'
	jz %%out	
	cmp byte[esi],32
	jnz %%out1

%%out1:	inc esi
	jmp %%lp

%%out:	inc ebx
	inc esi
	jmp %%lp

%%end:	push ebx
	push msg1
	call printf
	add esp,8


%endmacro

section .data
	msg db "Enter String : ",10,0
	msg1 db "Number of vowels in given string are : %d ",10,0
section .bss
	string resb 100

section .text
	global main
	extern printf,gets,puts,scanf
main:
	push msg
	call printf
	add esp,4
	
	push string
	call gets
	add esp,4
	
	vowel string
	
	ret
