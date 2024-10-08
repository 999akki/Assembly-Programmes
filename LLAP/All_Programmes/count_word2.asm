section .data
	msg  db "My name i Akshay i studding i computer science",10
	msg2 db "Count is %d",10,0	
section .bss
section .text
	global main
	extern printf
main:
	mov esi, 0
	mov ebx, msg

lp:	cmp byte[ebx],0
	jz out
	cmp byte[ebx],"i"
	jz eq
	inc ebx
	jmp lp

eq:	mov edi, dword[ebx-1]
	cmp edi, " "
	jz eq1
	inc ebx;
	jmp lp

eq1:	mov edi, dword[ebx+1]
	cmp edi, " "
	jz found
	inc ebx
	jmp lp

found:	inc esi
	jmp lp
		
out:	push esi
	push msg2
	call printf
	add esp, 8
	
	ret 
