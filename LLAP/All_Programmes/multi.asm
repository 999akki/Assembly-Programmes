section .data
	msg1 db "Enter number : ",10,0
	format1 db "%d",0
	msg db "Mulitiplication table of %d is : ",10,0
	format db "%d",10,0
section .bss
	save resd 1	
section .text
	global main
	extern printf,scanf
main:
	push msg1
	call printf
	add esp,4
	
	push save
	push format1
	call scanf
	add esp,8

	push dword[save]
	push msg 
	call printf
	add esp,8
	
	mov esi,0

lp:	inc esi
	cmp esi,11
	jz endp
	mov eax,dword[save]
	mul esi
	push eax
	push format
	call printf
	add esp,8
	jmp lp
		
endp:	ret
