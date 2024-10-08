section .data
	msg db "count vowel in this string",0
	len equ $- msg
	msg1 db "Count of Vowel in given string is : %d",10,0
section .bss

section .text
	global main
	extern printf,puts
main:
	mov ecx,len
	mov ebx,0
	mov edi,msg

lp1:	cmp ecx,0
	jz out
	cmp byte[edi],"A"
	jz lp
	cmp byte[edi],"E"
	jz lp
	cmp byte[edi],"I"
	jz lp
	cmp byte[edi],"O"
	jz lp
	cmp byte[edi],"U"
	jz lp
	cmp byte[edi],"a"
	jz lp
	cmp byte[edi],"e"
	jz lp
	cmp byte[edi],"i"
	jz lp
	cmp byte[edi],"o"
	jz lp
	cmp byte[edi],"u"
	jz lp
	
	dec ecx
	inc edi
	jmp lp1

lp: 	inc ebx
	inc edi
	dec ecx
	jmp lp1

out:	push ebx
	push msg1
	call printf
	add esp,8
	ret
