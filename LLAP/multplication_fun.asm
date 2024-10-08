section .data 
	msg db "addition is  %d",10,0
section .bss
section .text
	global main
	extern printf,scanf,puts,abc
main:
	enter 0,0
	mov eax,20
	mov ebx,30
	push eax
	push ebx
	call abc
	add esp,8
	push eax
	push msg
	call printf
	add esp,8
	leave
	ret
