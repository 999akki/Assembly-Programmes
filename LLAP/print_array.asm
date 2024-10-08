; program to print 2nd highest  element in array

section .data
	msg db "Enter how many elements want to add in array : ",10,0
	format db "%d",0
	msg1 db "Array Elements are : ",10,0
	msg2 db 10,"Highest Number in given array list is : %d",10,0
	msg3 db "2nd Highest Element in given array list is : %d",10,0
	format1 db "%d ",0
	n dd 4	
section .bss
	save resd 1
	save1 resd 100
section .text
	global main
	extern printf,scanf
main:
	push msg
	call printf
	add esp,4

	push save
	push format
	call scanf
	add esp,8

	mov ebx,0
lp:	mov eax,dword[n]
	mul ebx
	add eax,save1
	push eax
	push format
	call scanf
	add esp,8
	inc ebx
	cmp ebx,dword[save]
	jnz lp	
	
	push msg1
	call printf
	add esp,4

	mov ebx,0
lp1:	mov eax,dword[n]
	mul ebx
	add eax,save1
	push dword[eax]
	push format1
	call printf
	add esp,8
	inc ebx
	cmp ebx,dword[save]
	jnz lp1

	
	
	mov ebx,-1
lp2:	inc ebx
	cmp ebx,dword[save]
	jz out
	mov eax,dword[n]
	mul ebx
	add eax,save1

	cmp dword[eax],esi
	jnge lp2

	mov esi,dword[eax]
	jmp lp2

out:	mov edi,esi      ;storing greater number 
	push esi
	push msg2
	call printf
	add esp,8

	mov esi,0

	mov ebx,-1
lp3:	inc ebx
	cmp ebx,dword[save]
	jz out1
	mov eax,dword[n]
	mul ebx
	add eax,save1

	cmp edi,dword[eax]
	jz lp3
	
	cmp dword[eax],esi
	jnge lp3

	mov esi,dword[eax]
	jmp lp3
	


out1:
	push esi
	push msg3
	call printf
	add esp,8
	ret	
	

