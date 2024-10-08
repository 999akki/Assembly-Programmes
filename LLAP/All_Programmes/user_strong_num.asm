%macro fact 1
        mov eax, %1
	cmp eax,1
	je %%z	
        mov ecx, %1
%%y:    dec ecx
        mul ecx
        cmp ecx,1
        jz %%z
        jmp %%y
%%z:
          
	  add esi,eax
%endmacro
 
section .data
	msg db "Enter number to check Strong Num : ",10,0
	format db "%d",0
	msg1 db "It is strong number",10,0
	msg2 db "It is not strong number",10,0
section .bss
	n resd 1
section .text
	global main
	extern printf,scanf
main:
	push msg
	call printf
	add esp,4

	push n 
	push format
	call scanf
	add esp,8
	
	mov esi,0
	mov eax,dword[n]	
	mov ebx,10
lp:	xor edx,edx
	div ebx
	mov edi,eax
	fact edx
	mov eax,edi
	cmp eax,0
	jne lp
	
	
	cmp esi,dword[n]
	jnz out
	push msg1
	call printf
	add esp,4
	jmp exit

out:	push msg2
	call printf
	add esp,4

exit:	
	ret	
