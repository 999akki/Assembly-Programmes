section .data
	string db 10,"Hello my name is Akshay"
	len equ $-string
	store db "%d",0
section .bss
section .text
	global main
	extern printf,puts
main:	
	mov ecx,len
	mov edi,store
	mov esi,string
	add esi,len
	sub esi,1
lp:	std
	lodsb
	cld
	stosb
	loop lp
	push store
	call printf
	add esp,4
	ret	

;;doubt
;;why there is garbage value in o/p
