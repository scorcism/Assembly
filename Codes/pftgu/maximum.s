#PURPOSE: This program is used to find maximum among the numbers provided.
#
#VARABLES: The registers are as follows
# 
# %edi - Hold the current element index number
# %ebx - Largest data item found
# %eax - Current Data item
#
# The Following memory location are used:
# 
# data_items: contains the item data. A 0 is used to terminate the the data.
#

.section .data

data_items:
	.long 3,34,43,23,4,23,42,4,32,45,4,0

.section .text

.globl _start # This is for the assembler and linker. From where to start the prgram

_start:
	movl $0, %edi	# Move 0 into index register
	movl data_items(,%edi,4), %eax	# Load the First byte of data.
	# movl BEGINNINGADDRESS(,%INDEXREGISTER,WORDSIZE)
	movl %eax, %ebx	# Since this is the first item %eax will be bigger

start_loop: # Loop start
	cmpl $0, %eax	# Check if we hit the end
	je loop_exit	# If we hit the 0 jump if equal (Conditional jump)
	incl %edi 	# Increment edi
	movl data_items(,%edi,4), %eax
	cmpl %ebx, %eax	# Compare values 
	jle start_loop # Jump to start if less then equal
	movl %eax, %ebx	#Move the value at the largest
	jmp start_loop	# unconditional jump

loop_exit:
# %ebx is the status code for the exit system call
# and it already has the maximum number
	movl $1, %eax	# system exit call
	int $0x80

