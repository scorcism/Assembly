; Write a program that display a message on the screen
; This semi-colan is used as an comment.

; The very first line in assmebly is model directive.
;Model Directive
; eg .Model memory model
; This model directive is for the assmebler to tell 
; that to create a 64 kb code or 64kb data secret to creaate
; inside our memory as per [ small ]

.model small
.stack 100h ; stack segment
.data 
; All the variables are declared in data secgemt
; msg is the vairble name, db is define byte
    msg db 'My First Assembly Code $'
    ; In assembly the string termination charcter is $

; Our code segment
; Here we will create a function which will user defined
; From where the execution of our program will start
; 
.code
    main proc ; This is used to create user defined procedure
        ; The name of this function is main coz as in c and c++ the execution of a prgram starts form main
        ; We can use any name except main
        mov ax,@data ; The data segmet is moved in ax register
        mov ds,ax ; The data segment create in the above lines address is stored to the actual data segment
        ; As we cannot move directly form segment to segment thst why we are using a general purpose register
        ; The avobe 2 lines are very important to write
        
        ; Display a string
        Mov ah, 09h ; The service number is 09h and we will move this in ah register
        ; The requirement of this service number is, the string we want to display whose offset address should be in dx register
        Mov dx,offset msg
        int 21h ;
        
        ; Terminate a Program
        mov ah, 4ch
        int 21h
    
    
    main endp ; Used to end Procedure. Between this we will write our code
    end main
    
    
    
    
    
    
    
    
    
    
    
    

