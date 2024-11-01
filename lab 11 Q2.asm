                               .model small
.stack 100h
.data
arr db 48,49,50,51,52,53,54,55,56,54
.code 
main proc
    
   mov ax,@data
   mov ds,ax
   mov si,offset arr
   mov cx,10
   mov dx,[si]
   
   l:
   mov dx,[si]
   push dx
   
   inc si
   
   loop l
   
   mov cx,10
   
   l2:
   pop dx
   mov ah,2
   int 21h
   loop l2
    
    mov ah,4ch
    int 21h
    main endp
end main