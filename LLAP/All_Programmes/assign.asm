section .data
	msg db "hello my name is akshay ",10,0
	len equ $-msg

section .bss
	
	dest resb len
	revdest resb len
	new resb len
	

section .text
	global main
	extern puts,printf

main:	push msg
	call printf
	add esp,4

	mov esi,msg
	mov ebx,dest

lp:	cmp byte[esi],10
	jz end

	mov edi,esi

	mov ecx,100
	mov edx,ecx

	mov al,32
	repne scasb
	
	sub edx,ecx
	mov ecx,edx		
	
	mov esi,edi
	sub esi,2
	sub ecx,1
	mov edi,ebx

rev:	std
	lodsb
	cld 
	stosb
	loop rev
	
	add esi,edx
	movsb
	mov ebx,edi
	jmp lp


end:	mov esi,dest
	mov edi,revdest
	mov ebx,revdest      ;storing the value
	mov ecx,len
	add esi,len
	sub esi,4
	sub ecx,3

lp1:	std 
	lodsb
	cld
	stosb
	loop lp1

;	mov eax,4
;	mov ebx,1
;	mov ecx,revdest
;	mov edx,len
;	int 0x80

	push revdest
	call puts
	add esp,4

	mov esi,ebx
	
again:	cmp byte[esi],0
	jz do
	inc esi
	jmp again

do:	mov dword[esi],32
	inc esi
	mov dword[esi],0
	
	mov esi,ebx
	mov ebx,new

lp2:	cmp byte[esi],0
	jz end1
	
	mov edi,esi

	mov ecx,100
	mov edx,ecx

	mov al,32
	repne scasb
	
	sub edx,ecx
	mov ecx,edx		
	
	mov esi,edi
	sub esi,2
	sub ecx,1
	mov edi,ebx

rev1:	std
	lodsb
	cld 
	stosb
	loop rev1
	
	add esi,edx
	movsb
	mov ebx,edi
	jmp lp2

		
end1:	mov esi,new

	push new 
	call puts
	add esp,4
	

again1:	cmp byte[esi],0
	jz do1
	inc esi
	jmp again1

do1:	mov dword[esi],32
	inc esi
	mov dword[esi],0
	
	mov esi,new
	

go1:	cmp byte[esi],0
	jz exit
	
	sub dword[esi],32
	inc esi 
	inc esi
	cmp byte[esi],32
	jz out3
	jmp go1
	
out3:	inc esi
	jmp go1	


exit:	push new
	call puts
	add esp,4

	ret


