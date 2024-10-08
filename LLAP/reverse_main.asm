section .data
	
section .bss
section .text
	global main
	extern printf,reverse
main:
	enter 0,0

	call reverse
	add esp,4

	leave
	 ret
	
