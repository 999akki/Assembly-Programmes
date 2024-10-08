section .data
	string db "Today is sunday monday tuesday wednesday friday",0
	len equ $-string
section .bss
	string1 resb 1000
section .text
	global main
	extern printf,puts
main:
	mov edi,string1
	mov esi,string
lp:	lodsb
	stosb
	loop lp
	push string1
	call puts
	add esp,4
	ret		
