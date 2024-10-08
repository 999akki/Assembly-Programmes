section .data
;	msg db "Enter how many columns want to add : ",10,0
	format db "%d",0
	msg1 db "Enter how many rows want to add : ",10,0
	star db "* ",0
	blank db "  ",0
	next db " ",10,0

section .bss
	i resd 1
;	j resd 1

section .text
	global main
	extern printf,puts,scanf
main:
	push msg1
	call printf
	add esp,4
	
	push i
	push format
	call scanf
	add esp,8

;	push msg1
;	call printf
;	add esp,4
	
;	push j
;	push format
;	call scanf
;	add esp,8

	push next
	call printf
	add esp,4

	mov esi,0 	;works as i variable
	mov edi,0	; works as j variable
	
lp2:	cmp esi,dword[i]
	jz out
lp:	cmp edi,dword[i]
	jz out1
	cmp edi,esi
	jle else

	push blank
	call printf
	add esp,4
	inc edi
	jmp lp

else:	push star
	call printf
	add esp,4	
	inc edi
	jmp lp

out1:	push next
	call printf
	add esp,4
	
	inc esi
	mov edi,0
	jmp lp2

out:	ret
	
