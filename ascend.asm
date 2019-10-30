
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.data
arr db 05h,16h,12h,08h
count dw 04h

.code
mov ax,@data
mov ds,ax

mov cx,count
dec cx   ;as comparison is one less than total arr elements

nextscan: mov bx,cx  ;imp
          lea si,arr  
          
nextcmp: mov al,[si]
         mov dl,[si+1]
         cmp al,dl
         jc noswap
         mov [si],dl
         mov [si+1],al
                  
noswap:  inc si
         dec bx
         jnz nextcmp
         loop nextscan         


ret




