section .data
	msg1 db "Enter size of array :",10,0
	format db "%d"
	msg2 db "Enter Element : ",10,0
	format1 db "%d ",0	
	format3 db " max element from given array is : %d",10,0
	format4 db "2nd max element from array is : %d",10,0
section .bss
	n resd 1
	inp resd 100
section .text
	global main
	extern printf,scanf,puts
main:
	push msg1
	call printf
	add esp,4 
	
	push n
	push format
	call scanf
	add esp,8
	
	mov edi,inp	
	mov ebx,dword[n]
lp:	cmp ebx,0
	jz out

	push msg2
	call printf
	add esp,4

	push edi
	push format
	call scanf
	add esp,8
	add edi,4
	dec ebx
	jmp lp
	
out:	mov edi,inp
	mov ebx,dword[n]
lp1:	cmp ebx,0
	jz out1

	push dword[edi]
	push format1
	call printf
	add esp,8
	add edi,4
	dec ebx
	jmp lp1

out1:
	
	mov edi,dword[n]
	inc edi
	mov eax,dword[inp]
	mov ecx,inp

lp2:	dec edi
	cmp edi,0
	jz out2
	
	add ecx,4

	mov esi,dword[ecx]
	cmp esi,eax
	jle lp2

	mov eax,esi
	

	jmp lp2

	

out2:   mov ebx,eax
	push eax
	push format3
	call printf
	add esp,8
	
	
	mov edi,dword[n]

	
	mov ecx,inp
loop:	cmp ebx,dword[ecx]
	jnz lp3
	add ecx,4
	jmp loop	
lp3:	mov eax,dword[ecx]
	
lp4:	dec edi
	cmp edi,0
	jz out3
	add ecx,4

	cmp ebx,dword[ecx]
	jz lp4
	
	mov esi,dword[ecx]
	cmp esi,eax
	jle lp4

	mov eax,esi

	jmp lp4

out3:	push eax
	push format4
	call printf
	add esp,8
	ret
	
	
