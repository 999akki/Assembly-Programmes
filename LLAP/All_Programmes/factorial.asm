section .data
	
section.text 
	global main
main:

	mov ecx,5
	mov eax,1
lp:	xor edx,edx
	mul ecx
	loop lp
