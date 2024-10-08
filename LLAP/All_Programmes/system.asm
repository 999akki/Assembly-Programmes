section .data
	msg db "Enter string",10,0
	len equ $- msg
	msg1 db "given string : ",10,0
	len1 equ $- msg1

section .bss
	string resb 100

section .text
	global main
	extern scanf,gets
main:
	mov eax,4		;write system call denoted by number 4
	mov ebx,1		;file descriptor std  o/p denoted by 1
	mov ecx,msg		;address of buffer
	mov edx,len		;how much to write so we take length
	int 0x80

	mov eax,3		; read system call denoted by 3
	mov ebx,0		; file descriptor std o/p denoted 1
	mov ecx,string		;address of buffer
	mov edx,100		; how much to read sp we give length
	int 0x80

	mov eax,4		;write system call denoted by number 4
	mov ebx,1		;file descriptor std  o/p denoted by 1
	mov ecx,msg1		;address of buffer
	mov edx,len1		;how much to write so we take length
	int 0x80

	mov eax,4		;write system call denoted by number 4
	mov ebx,1		;file descriptor std  o/p denoted by 1
	mov ecx,string		;address of buffer
	mov edx,100		;how much to write so we take length
	int 0x80

	ret
