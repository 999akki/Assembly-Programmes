section .data
	array dd 12,10,52,45,-1   ;-1 is for array ending identifier
	msg1 db "Elements are : ",10,0	
	msg db " %d",10,0
section .text
	global main
	extern printf
main:

	mov ebx,array   ;contain base address of array
	push msg1
	call printf
	add esp,4
lp:
	cmp dword[ebx],-1
	jz end
	push dword[ebx]
	push msg
	call printf
	add esp,8
	add ebx,4
	jmp lp
end:	
;	mov eax,1
;	mov ebx,1
;	int 0x80
	ret
