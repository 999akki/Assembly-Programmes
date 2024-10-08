  %macro fact 1
           mov eax, %1
           mov ebx, %1
   %%y:    dec ebx
           mul ebx
           cmp ebx,1
           jz %%z
           jmp %%y
   %%z:
  
 %endmacro

section .data
	n dd 5
	n1 dd 4
	msg db "factorial of 5 is %d",10,0
	msg1 db "factorial of 4 is %d",10,0
section .text
	global main
	extern printf
main:
	
	fact dword[n]
	
	push eax
	push msg
	call printf
	add esp,8 


	fact dword[n1]

	push eax
	push msg1
	call printf
	add esp,8	

	ret
