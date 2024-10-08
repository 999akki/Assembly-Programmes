section .data
	;msg3 db "Addition is %d",10,0
section .bss
	temp resd 1
section .text
	global add:function
	extern printf
add:
	enter 0,0
	
	mov esi,dword[ebp+12]
	mov edi,dword[ebp+16]
	
	add esi,edi
	
	mov eax,dword[ebp+8]
	mov dword[eax],esi
	
	leave 
	ret
	
	

