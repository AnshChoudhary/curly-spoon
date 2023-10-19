.data
msg1: .asciiz "Enter a number: "
msg2: .asciiz "Number is odd. "
msg3: .asciiz "Number is even. "

.text
main: 
    li $v0,4
    la $a0,msg1
    syscall

    li $v0,5
    syscall

    move $t0,$v0
    li $t2,2
    div $t0,$t2
    li $t1,0
    mfhi $t3
    beq $t3,$t1,L
    
    li $v0,4
    la $a0,msg2
    syscall

    j exit

L:
    li $v0,4
    la $a0,msg3
    syscall

exit:
    li $v0,10
    syscall
