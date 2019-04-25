##################### General Information ###########################
# Jorge Huerta, CS 2318.254, Assignment 2 Part 1 Part D	
############################# Goals #################################
# Orompt the user for integer scores from Exam 1, 2, and Final.
# We will read the scores and computer the average.
# Display a labelled output.
########################## Data Segment #############################
			.data
promptEx1:		.asciiz "Enter the first exam score: "
promptEx2:		.asciiz "Enter the second exam score: "
promptFinal:		.asciiz "Enter the final exam score: "
outputAvg:		.asciiz "The average score is: "
########################## Code Segment #############################
			.text
			.globl main
main:
			li $v0, 4
			la $a0, promptEx1
			syscall
			li $v0, 5
			syscall
			move $t1, $v0		# Takes user's input for first exam	
			
			li $v0, 4
			la $a0, promptEx2
			syscall
			li $v0, 5
			syscall
			move $t2, $v0		# Takes user's input for second exam
			
			li $v0, 4
			la $a0, promptFinal
			syscall
			li $v0, 5
			syscall
			move $t3, $v0		# Takes user's input for the final exam
			
			li $t4, 115		# $t4 is loaded up with 115
			mul $t1, $t1, $t4	# $t1 and $t4 are multiplied and saved in $t1
			srl $t1, $t1, 9		# $t1 is then divided by 512
			
			li $t4, 29		# $t4 is loaded up with 29
			sll $t2, $t2, 3		# $t2 is multiplied by 8
			div $t2, $t2, $t4	# $t2 is divided by $t4 and saved in $t2
			
			srl $t3, $t3, 1		# divide final exam by 2
			
			add $t2, $t1, $t2	
			add $t7, $t2, $t3	# add up all the individual numbers
			
			li $v0, 4
			la $a0, outputAvg
			syscall
			li $v0, 1
			move $a0, $t7
			syscall			# print out the output
			
			li $v0, 10
       	   	      	syscall			# exit gracefully
