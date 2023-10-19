.data
msg1: .asciiz "Enter N: "
msg2: .asciiz "Factorial = "
no:    .word 0
factorial: .word 0

.text
.globl main

main: 
    li $v0, 4
    la $a0, msg1        # print msg1
    syscall

    li $v0, 5           # input number 
    syscall

    sw $v0, no          #store number in no

    li $t0, 1           #factorial = 0
    li $t1, 1           #t1 is basically 1
    lw $t2, no          #t2 is no

    blt $t2, $t1, outer

loop:
    blt $t2, $t1, outer 
    mul $t0, $t0, $t1
    addi $t1, $t1, 1
    j loop

outer: 
    sw $t0, factorial   
    
    li $v0, 4
    la $a0,, msg2
    syscall

    li $v0, 1
    lw $a0, factorial
    syscall

    li $v0, 10
    syscall

