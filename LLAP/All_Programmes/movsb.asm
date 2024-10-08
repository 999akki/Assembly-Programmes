section .data
	msg db "Hello world",0
	len equ $-msg
	msg1 db "Hello orld",0
	len1 equ $-msg1
	msg2 db "Equal",10,0
	msg3 db "Not Equal",10,0
section .bss
	tmsg resb 100
section .text
	global main
	extern printf,puts
main:
	
;This part of Code is Only for to print Hello From Hello World so how to do that we can get from this code

	mov ecx,100
	mov edx,ecx
	mov al," "
	mov edi,msg
	repne scasb
	sub edx,ecx

	mov eax,4 		;write call
	mov ebx,1 		;stdin
	mov ecx,msg 		;it stores string in ecx and length in edx
	int 0x80


;--------------------------------------------------------------------------------

;This part of code is only for how to print a string on output screen by this code we can get that

	mov esi,msg
	mov edi,tmsg
	
	mov ecx,len
	
	repne movsb
	
	push tmsg
	call puts
	add esp,4

	
;----------------------------------------------------------------------------
	
;This part of code is only for to check weather by both string are equal or not by this code we can get that

	mov eax,len1
	cmp eax,len
	jnz endp
	
	mov ecx,len
	mov esi,msg
	mov edi,msg1

	
	repe cmpsb

	cmp ecx,0
	jnz endp	
	
	push msg2
	call printf
	add esp,4 
	jmp endc

endp:
	push msg3
	call printf
	add esp,4 
	


endc:	ret
