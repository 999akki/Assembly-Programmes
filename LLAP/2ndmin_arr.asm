section .data
	msg db "Enter size of array : ",10,0
	format db "%d",0
	msg1 db "Enter Element : ",10,0
	format1 db "%d ",0
	msg2 db "Smallest element in given array is : %d",10,0
	msg3 db "2nd Smallest element in given array is : %d",10,0
	
section .bss
	n resd 1
	inp resd 100
section .text
	global main
	extern printf,scanf,puts
main:
	push msg
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
	
	push msg1
	call printf
	add esp,4

	push edi
	push format
	call scanf
	add esp,8

	add edi,4
	dec ebx

	jmp lp

out: 	mov edi,inp
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

out1:	mov edi,dword[n]
	mov eax,dword[inp]
	mov ecx,inp
	
lp3:	dec edi
	cmp edi,0
	jz out2

	add ecx,4
	
	mov esi,dword[ecx]
	cmp eax,esi
	jle lp3
	mov eax,esi
	
	jmp lp3

out2:	mov ebx,eax
	push eax
	push msg2
	call printf
	add esp,8
	
	mov edi,dword[n]
	inc edi
	mov ecx,inp

lp5:	dec edi
	cmp edi,0
	mov eax,dword[ecx]
	cmp ebx,eax
	jnz lp4
	add ecx,4
	jmp lp5

lp4:	dec edi
	cmp edi,0
	jz out3
	
	add ecx,4
	mov esi,dword[ecx]
	
	cmp ebx,esi
	jnz lp7
;	add ecx,4
	jmp lp4
			
lp7:	cmp eax,esi
	jle lp4
	mov eax,esi
	jmp lp4
	
out3:	push eax
	push msg3
	call printf
	add esp,8
	
	ret
