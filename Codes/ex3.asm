; Display 9 stars with the message on the top

global _start

section .data
	msg db "Displaying 9 stars",0x0a ; A Message
	len equ $ - msg 
	stars9 tims 9 '*'

section .text
_start: ; Tell the linker entry point
	mov eax, 4 ; System write call 
	mov ebx, 1 ; Stdout file descriptor
	mov ecx,msg ; Bytes to write
	mov edx, len ; Number of bytes to write
	int 0x80 ; Call Kernaly

	
	mov eax, 4 ; System write call 
	mov ebx, 1 ; Stdout file descriptor
	mov ecx,stars9 ; Bytes to write
	mov edx, 9 ; Number of bytes to write
	int 0x80 ; Call Kernal
	
	; Exit Program
	mov eax,1 ; System exit calls
	int 0x80


