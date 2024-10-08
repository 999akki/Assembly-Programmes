section.data
	string db "Low level programming",0
	msg db "lenghth of string is : %d",10,0
section .text
	global main
	extern printf
main:
	mov eax,string
	xor ecx,ecx
t:	cmp byte[eax],0
	jz lp
	inc ecx
	inc eax
	jmp t
lp:	push ecx
	push msg
	call printf
	add ecx,8
ret
