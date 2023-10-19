.data
msg1: .asciiz "Enter a Number: "
msg2: .asciiz "Result: "
msg3: .asciiz "Prime"
msg4: .asciiz "Not Prime"
.text
.globl main

main: 
    li $v0, 4
    la $a0, msg1 #display msg1
    syscall

    li $v0, 5
    syscall

    move $t1, $v0   #t1 is the number

    li $v0, 4
    la $a0, msg2
    syscall

    li $t0,1    # t0 = 1

loop:
    beq $t0,$t1,exit    # go to exit at t0 == t1
    addi $t0,$t0,1      # add t0 = t0 + 1
    beq $t0,$t1,yes     # go to yes if t0 == t1
    div $t1,$t0         # divide t1/t0
    mfhi $t2            # move hi bit from mutiplying into t2
    bgt $t2,$zero,yes   # go to yes if t2 is greater than 0 
    beq $t2,$zero,no    # go to no if t2 is zero
    j loop
    
no:
    li $v0, 4
    la $a0, msg4 # Display not prime
    syscall
    j exit

yes:
    li $v0, 4
    la $a0, msg3 # display not prime
    syscall
    j exit

exit:
    li $v0, 10	
    syscall