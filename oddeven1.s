.data
msg1: .asciiz "Enter the number: "
msg2: .asciiz "The Number is Even. "
msg3: .asciiz "The Number is Odd. "

.text 
main: 
    li $v0, 4
    la $a0, msg1 
    syscall

    li $v0, 5
    syscall

    move $t0, $v0

    li $t2, 2
    div $t0, $t2
    mfhi $t3
    beq $t3, $zero, L 

    li $v0, 4
    la $a0, msg3
    syscall

    j exit

L:
    li $v0, 4
    la $a0, msg2
    syscall

exit:
    li $v0, 10
    syscall