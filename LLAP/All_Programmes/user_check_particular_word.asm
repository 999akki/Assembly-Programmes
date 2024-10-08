section .data
	msg db "Enter String",10,0
	msg1 db "Count of i words in given string is %d",10,0
	
section .bss
	string resb 100

section .text
	global main
	extern printf,gets,puts
main:
	push msg
	call printf
	add esp,4

	push string 
	call gets
	add esp,4

;case1 :--------------------- [32 i 32]

	mov ecx,0
	mov edi,string
	dec edi

lp:	inc edi
	
	cmp byte[edi],32
	jnz go
lp1:	inc edi
	cmp byte[edi],"i"
	jnz go
	inc edi
	cmp byte[edi],32
	jnz go
	
	inc ecx
	jmp lp1

go:	cmp byte[edi],0
	jnz lp

;case2 :----------------------- [i 32]
	
	mov esi,0
	mov edi,string
	
	cmp byte[edi],"i"
	jnz go1
	inc edi
	cmp byte[edi],32
	jnz go1
	inc esi
	

go1:	add ecx,esi

;case3 :-------------------------- [32 i 0]

	mov esi,0
	mov edi,string
	dec edi
	
go2:	inc edi	
	cmp byte[edi],32
	jnz go3
	inc edi
	cmp byte[edi],"i"
	jnz go2
	inc edi
	cmp byte[edi],0
	jnz go2
	inc esi
	
	
go3:	cmp byte[edi],0
	jnz go2

	add ecx,esi

	push ecx
	push msg1
	call printf
	add esp,8

	ret	
