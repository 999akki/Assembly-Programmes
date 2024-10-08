section .data
	msg db "Enter String to check : ",10,0
section .bss
	string resb 100
section .text
	global main
	extern pallindrome,printf,gets
main:
	enter 0,0

	push msg	
	call printf
	add esp,4
	
	push string
	call gets
	add esp,4
	
	push string
	call pallindrome
	add esp,4
	
	leave
	ret	
