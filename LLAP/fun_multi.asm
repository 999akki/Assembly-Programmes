section .data
	msg db "Enter number : ",10,0
	format db "%d",10,0
section .bss
	save resd 1
section .text
	global main
	extern multi,printf,scanf	
main:	pusha
	push msg
	call printf
	add esp,4
	popa
	
	pusha
	push save
	push format
	call scanf
	add esp,8
	popa



	pusha
	push dword[save]
	push format
	call printf
	add esp , 8
	popa




;	pusha
;	push ebx
;	call multi
;	add esp,4
;	popa

	ret
	
