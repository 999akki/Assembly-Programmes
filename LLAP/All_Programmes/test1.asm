  section .data
          ip1 dd 19
          msg2 db "%d",10,0
          ip2 dd 1
  section .bss
          save resb 100
  section .text
          global main
          extern printf,puts
  main:
  
          
  lp:     mov eax,dword[ip1]
          mul dword[ip2]
  
          push eax
          push msg2
          call printf
          add esp,8
  
          inc dword[ip2]
          cmp dword[ip2],11
          jnz lp
  
          ret

