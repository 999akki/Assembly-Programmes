section .data
	msg db "Enter string :",10,0
	format db "%d"
	msg1 db "Enter letter to be search for occurance : ",10,0
	msg2 db "occurance is : %d",10,0

section .bss
	string resb 100
	let resb 1

section .text
	global main
	extern printf,puts,gets,scanf
main:
	push msg
	call printf
	add esp,4

	push string 
	call gets
	add esp,4

	push msg1
	call printf
	add esp,4

	push let
	call gets
	add esp,4

	mov esi,string
	
	mov al,byte[let]
	mov ecx,0
	
lp:	cmp byte[esi],0
	jz end
	cmp byte[esi],al
	jz out
	inc esi
	jmp lp

out:	inc ecx
	inc esi
	jmp lp

end:	push ecx
	push msg2
	call printf
	add esp,8


	ret			
