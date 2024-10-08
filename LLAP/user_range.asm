section .data
	msg db "Enter Starting point : ",10,0
	format db " %d",0
	msg1 db "Enter ending point : ",10,0
	msg2 db "Number which are divisible by 2 are :"
	
section .bss
	start resd 1
	end resd 1
section .text
	global main
	extern printf,scanf,puts
main:
	push msg
	call printf
	add esp,4
	
	push start 
	push format	
	call scanf
	add esp,8
	
	push msg1
	call printf
	add esp,4
	
	push end
	push format	
	call scanf
	add esp,8

	mov ebx,2

	mov esi,dword[start]
	dec esi
	mov edi,dword[end]
lp:	inc esi
	cmp esi,dword[end]
	jz out
	mov eax,esi
	xor edx,edx
	div ebx
	cmp edx,0
	jne lp
	
	push esi
	push format
	call printf
	add esp,8
	jmp lp

out:	ret
	
