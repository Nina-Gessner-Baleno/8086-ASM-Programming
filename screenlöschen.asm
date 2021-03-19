Program  : clear screen Procedure
FileName : screenlöschen.asm
I/P 	 : Nill
O/P 	 : clears the screen
By       : Nina- htw dresden/Dozent
----------------------------------------

org 100h
   mov ax,0b800h
   mov es,ax
   mov di,0
   mov al,' '
   mov ah,07d
   loop_clear_12:
        mov word ptr es:[di],ax
        inc di
        inc di
        cmp di,4000
   jle loop_clear_12
   
   mov ah,4ch  ; dos interrupt 21 function 4ch to terminate program
   mov al,00
   int 21h
ret
                    
