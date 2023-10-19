.data
msg1: .asciiz "Enter the number: "
msg2: .asciiz "The Sum of digits is: "

.text
.globl main

main: 
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall

    move $t0, $v0

    li $t1, 0  # store sum
    li $t2, 10  # stores 10

next: 
    beq $t0, $zero, print_result
    div $t0, $t2
    mfhi $t3
    mflo $t0
    add $t1, $t1, $t3
    j next

print_result:
    la $a0, msg2
    li $v0, 4
    syscall

    move $a0, $t1
    li $v0,1
    syscall

    li $v0, 10
    syscall