
; using zero flag in code of adding 2 number(0-9) entered by user 
; The status of zero flag = 1 if the result is zero
; The status of zero flag = 0 if the result is non zero



.model small
.stack 100h
.data
    n db  10,13, 'Zero flag = 1$'
    z db  10,13, 'Zero flag = 0$'
    r db  10,13,'Result: $'
.code     

main Proc 
    
    mov ax,@data
    mov ds,ax
    
    mov ah, 1      ; 1st input
    int 21h     
    sub al, 48  
    mov bl, al  
   
    mov dl, '+'     ;print '+'
    mov ah, 2
    int 21h
     
    
    mov ah, 1       ; 2nd input             
    int 21h      
    sub al, 48  
    mov cl, al  
     
    
    add bl, cl         ; addition
                     
                     
    mov dl, r          ; print 'Result:'
    mov dx,offset r
    mov ah, 9
    int 21h

   
    add bl,48     ; print result of addition
    mov dl, bl
    mov ah, 2
    int 21h
    
   
    sub bl,48 
    cmp bl, 0        ;comparing result and 0    
    
    jne true         ; if not equal jump to print 'zero flag=0'
    

    
    false:
   
    mov  dl , n         ; print zero flag=1
    mov dx,offset n
    mov ah, 9
    int 21h
    

    
    mov ah, 4ch  ; end 
    int 21h  
    
    true:
                     
    mov dl,z            ; print zero flag=0
    mov dx,offset z
    mov ah, 9
    int 21h 
    
    mov ah, 4ch  ; end
    int 21h
   
     
main endp
end main
