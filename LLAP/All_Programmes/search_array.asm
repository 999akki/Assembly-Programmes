section .data
	arr dd 12,32,34,45,78,-1
	msg1 db "present",10,0
	msg2 db "absent",10,0
        
section .bss
section .text
	global main
	extern printf
main:
	mov esi,arr
lp1:	cmp dword[esi],-1
	jz out
	cmp dword[esi],44
	jz lp
	add esi,4
	jmp lp1
lp:	push msg1
	call printf
	add esp,4
	jmp exit
out:	push msg2
	call printf	
	add esp,4
exit:	ret
