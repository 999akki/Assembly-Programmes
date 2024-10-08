section .data
	msg db "madam"
	len equ $-msg
	res1 db "it is pallindrome",0
	res2 db "It is not pallindrome",0
section .bss
	string resb 100
section .text
	global main
	extern puts
main:

	mov ecx,len
	mov esi,msg
	mov edi,string
	add esi,len
	sub esi,1
lp: 	std
	lodsb
	cld
	stosb
	loop lp

	
	mov ecx,len
;	sub ecx,2
	mov esi,msg
	mov edi,string
	repe cmpsb
	cmp ecx,0
        jnz out1
 
        push res1
        call puts
        add esp,4
        jmp end
  
out1:   push res2
        call puts
        add esp,4
  
end:    ret


















