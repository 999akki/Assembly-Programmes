section .data
	msg db "fibonacii series of 10 number is :",10,0
	msg3 db " %d ",0
section .bss
section .text
	global fibo:function
	extern printf
fibo:
	enter 8,0

	mov esi,dword[ebp+8]
	mov edi,dword[ebp+12]
	mov dword[ebp-4],esi   ;0
	mov dword[ebp-8],edi   ;1
	
	push msg
	call printf
	add esp,4
	
;	push dword[ebp-4]
	push esi
	push msg3
	call printf
	add esp,8
	
;	push dword[ebp-8]
	push edi
	push msg3
	call printf
	add esp,8

	mov esi,dword[ebp-4]
	mov edi,11
	mov ebx,0

lp:	dec edi
	cmp edi,0
	jz out
	add esi,dword[ebp-8]
	push esi
	push msg3
	call printf
	add esp,8
	mov ebx,esi
	mov esi,dword[ebp-8]
	mov dword[ebp-8],ebx	
	jmp lp

out:	leave
	ret
	
