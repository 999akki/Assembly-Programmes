section .data
	msg db "I am persuing my MSC from PUCSD"
	len equ $- msg
	msg1 db "Reverse of given string is : ",10,0
section .bss
	string resb 100
section .text
	global main
	extern printf,puts
main:
	enter 0,0

	push msg1 
	call printf
	add esp,4

	mov ecx,len
	mov esi,msg
	add esi,len
	dec esi
	mov edi,string
lp:	std
	lodsb
	cld
	stosb
	loop lp

	; both commented code will also work instead of pushong string we can push edi also

;	mov edi,string
;	push edi

	push string
	call puts
	add esp,4

	leave

	ret
	
