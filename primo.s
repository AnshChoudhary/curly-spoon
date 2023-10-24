.data
msg1: .asciiz "Enter the number to check prime: "
msg2: .asciiz "The Number is Prime."
msg3: .asciiz "The Number is not Prime."

.text
.globl main

main: 
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall

    move $t0, $v0   # t0 = N

    li $t1, 2       # t1 = i
    
loop: 
    beq $t1, $t0, prime     # i < N  then  
    div $t0, $t1        
    mfhi $t2
    beq $t2, $zero, not_prime
    addi $t1, $t1, 1
    j loop

prime: 
    li $v0, 4
    la $a0, msg2
    syscall
    j exit

not_prime:
    li $v0, 4
    la $a0, msg3
    syscall
    j exit

exit: 
    li $v0, 10
    syscall
