section .data
	msg1 db "Hello PLAP",0
	len1 equ $- msg1
	msg2 db "Hello LLAP",0
	len2 equ $- msg2
	op db "Strings are same",10,0
	op1 db "Strings are not same",10,0

section .bss
	
section .text
	global main
	extern printf,puts
main:
	mov eax,len1
	cmp eax,len2
	jnz out
	
	mov ecx,len1
	mov esi,msg1
	mov edi,msg2
	
	repe cmpsb
	
	cmp ecx,0
	jnz out

	push op
	call printf
	add esp,4
	jmp end

out:	push op1
	call printf
	add esp,4
	
end:	ret
	
