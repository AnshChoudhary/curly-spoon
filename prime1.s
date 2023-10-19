.data
msg1: .asciiz "Enter a number: "
msg2: .asciiz "The Number is Prime. "
msg3: .asciiz "The Number is not Prime. "

.text
.globl main

main: 
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall

    move $t1, $v0 
    li $t0, 1 

loop: 
    beq $t0, $t1, exit
    addi $t0, $t0, 1
    beq $t0, $t1, yes
    div $t1, $t0
    mfhi $t2
    bgt $t2, $zero, yes
    beq $t2, $zero, no
    j loop

no: 
    li $v0, 4
    la $a0, msg3
    syscall
    j exit

yes: 
    li $v0, 4
    la $a0, msg2
    syscall
    j exit

exit: 
    li $v0, 10
    syscall