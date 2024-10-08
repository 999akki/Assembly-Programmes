section .data
          msg db "Hello"
          len equ $-msg
section .bss
          string resb 100
section .text
          global main
          extern printf,puts
main:
          mov ecx,len
          mov edi,string
          mov esi,msg
          add esi,len
          dec esi
lp:    	  std
          lodsb
          cld
          stosb
          loop lp
  
          mov edi,string
          push edi        
          call printf
          add esp,8
          ret
 	
