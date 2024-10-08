section .data
	array dd 12,10,52,45,-1   ;-1 is for array ending identifier
	msg1 db "Elements are : ",10,0	
	msg db " %d",10,0
	res db "Addition of array elements is : %d",10,0
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
	jz lp1
	push dword[ebx]
	push msg
	call printf
	add esp,8
	add ebx,4
	jmp lp

lp1:	mov eax,0
	mov ecx,array
lp2:	add eax,dword[ecx]
	add ecx,4
	cmp dword[ecx],-1
	jz end
	jmp lp2
	
end:	push eax
	push res
	call printf
	add esp,8
	ret
