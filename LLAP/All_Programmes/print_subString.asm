section .data
	msg2 db "%s",10,0
	msg db "We are printing Substring Of given String",0
	len equ $- msg
	msg1 db "Substring of Given String is :",10,0

section .bss
	string resb 100

section .text
	global main
	extern printf,puts
main:
	push msg1
	call printf
	add esp,4

	mov ecx,100
	mov edx,ecx
	mov edi,msg
	mov al," "
	repne scasb
	repne scasb
	sub edx,ecx
		
;	mov eax,4               ;write call
 ;     	 mov ebx,1               ;stdin
  ;      mov ecx,msg             ;it stores string in ecx and length in edx
   ;     int 0x80
 	
	mov ecx,edx
	mov esi,msg
	mov edi,string

	repne movsb
	
	push string 
	call puts
	add esp,4


	ret
	
