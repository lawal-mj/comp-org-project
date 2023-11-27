.data
   prompt: .asciiz "Please enter a number N (N >= 25): "
   error_msg: .asciiz "Illegal Number!\n"
   newline: .asciiz "\n"


.text
.globl main

main:
    # set up prompt for input 
    li $v0, 4
    la $a0, prompt
    syscall

    # Read input number
    li $v0, 5
    syscall

    # Store the number in $t0
    move $t0, $v0