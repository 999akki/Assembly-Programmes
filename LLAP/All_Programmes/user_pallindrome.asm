section .data
	inp1 db "Enter a string : ",0
	format db "%d",0
	msg1 db "It is pallindrome",0
	msg2 db "It is not pallindrome",0
section .bss
	save resb 100
	len equ $-save
	save1 resb 100
section .text
	global main
	extern printf,puts,scanf
main:
	push inp1
	call puts
	add esp,4
	push save
	push format
	call scanf
	add esp,8
	
	mov ecx,len
	mov edi,save1
	mov esi,save
	add esi,len
	sub esi,1
lp:	std
	lodsb
	cld
	stosb
	loop lp
	
	mov ecx,len
	mov esi,save
	mov edi,save1
	repe cmpsb
	cmp ecx,0
	jnz out
	
	push msg1
	call puts 
	add esp,4
	jmp end
	
out: 	push msg2
	call puts
	add esp,4
	
end: 	ret
