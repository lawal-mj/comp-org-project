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

   # Check if the number is legal (>= 25)
    li $t1, 25
    blt $t0, $t1, error

    j proceed

error:
    # Print error message
    li $v0, 4
    la $a0, error_msg
    syscall

    # Jump back to main to prompt again
    j main

proceed:
    # create first two fib numbers
    li $t2, 0             
    li $t3, 1   