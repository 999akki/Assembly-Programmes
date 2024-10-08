section .data
	array dd 12,10,52,45,-1   ;-1 is for array ending identifier
	msg1 db "Elements are : ",10,0	
	msg db " %d",10,0
	sizeOfInt dd 4
section .text
	global main
	extern printf
main:


	push msg1
	call printf
	add esp,4	
	xor ebx,ebx    ;mov ebx,0
lp:
;	mov eax,array   ;contain base address of array
	mov eax,dword[sizeOfInt]
	mul ebx
	add eax,array
	cmp dword[eax],-1
	jz end
	push dword[eax]
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
