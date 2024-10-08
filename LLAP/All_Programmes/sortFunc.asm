sectino .text
	global sort
sort:
pusha
	mov ebx, 0
	mov ebp, esp+4
	mov eax, 4
	mul ebx
	add ebx,dword[ebp]
out: 


popa	
