section .data
	msg1 " %d ",0
	msg2 " %d ",0
section .bss
section .text
	global main
	extern printf,scanf,pqr
main:
	enter 0,0
	mov eax,0	
	mov ebx,1
	push eax
	push ebx
	call pqr
	add esp,8
	push eax
	push msg1
	call printf
	add esp,4
	push 
	leave
	ret
