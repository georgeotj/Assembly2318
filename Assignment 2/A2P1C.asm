##################### General Information ###########################
# Jorge Huerta, CS 2318.254, Assignment 2 Part 1 Part C	
############################# Goals #################################
# Load a global array of 5 integers AT THE SAME TIME	
# Print out a labeled output of the original order	
# Reorder the integers, swap 1 with 4, and 2 with 5. 	
# Print out a labeled output of the new array.	
########################## Data Segment #############################
			.data
outputOG:		.asciiz "The original array is in order: "
newLine:		.asciiz "\n"
space:			.asciiz " "
outputNew:		.asciiz "The updated array is in order: "
intArray:		.word 44, 99, 33, 11, 55
########################## Code Segment #############################	
			.text
			.globl main
main:
			la $t6, intArray
			
			li $v0, 4
			la $a0, outputOG
			syscall			# prints out outputOG
			
			lw $a0, 0($t6)
			li $v0, 1
			syscall			
			li $v0, 4
			la $a0, space
			syscall			# prints out intArray[0] with a space
			
			lw $a0, 4($t6)
			li $v0, 1
			syscall			
			li $v0, 4
			la $a0, space
			syscall			# prints out intArray[1] with a space
			
			lw $a0, 8($t6)
			li $v0, 1
			syscall			
			li $v0, 4
			la $a0, space
			syscall			# prints out intArray[2] with a space
			
			lw $a0, 12($t6)
			li $v0, 1
			syscall			
			li $v0, 4
			la $a0, space
			syscall			# prints out intArray[3] with a space
			
			lw $a0, 16($t6)
			li $v0, 1
			syscall			
			li $v0, 4
			la $a0, space
			syscall			# prints out intArray[4] with a space
			
			la $a0, newLine
			syscall			# prints out a new line
			
			lw $t1, 0($t6)
			lw $t2, 4($t6)
			lw $t4, 12($t6)
			lw $t5, 16($t6)		# loads the ints into their original order in the registers
			
			sw $t4, 0($t6) 
			sw $t1, 12($t6)
			sw $t5, 4($t6)
			sw $t2, 16($t6)		# swaps around the ints, 1st with 4th and 2nd with 5th.
			
			li $v0, 4
			la $a0, outputNew
			syscall			# prints out outputNew
			
			lw $a0, 16($t6)
			li $v0, 1
			syscall			
			li $v0, 4
			la $a0, space
			syscall			# prints out intArray[4] with a space
			
			lw $a0, 12($t6)
			li $v0, 1
			syscall			
			li $v0, 4
			la $a0, space
			syscall			# prints out intArray[3] with a space
			
			lw $a0, 8($t6)
			li $v0, 1
			syscall			
			li $v0, 4
			la $a0, space
			syscall			# prints out intArray[2] with a space
			
			lw $a0, 4($t6)
			li $v0, 1
			syscall			
			li $v0, 4
			la $a0, space
			syscall			# prints out intArray[1] with a space
			
			lw $a0, 0($t6)
			li $v0, 1
			syscall			
			li $v0, 4
			la $a0, space
			syscall			# prints out intArray[0] with a space
