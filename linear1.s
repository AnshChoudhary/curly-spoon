.data
array: .word 1, 2, 4, 34, 45, 54, 64, 25, 23, 98
length: .word 10
msg0: .asciiz "Enter a number: "
msg1: .asciiz "Item not found in array."
msg2: .asciiz "Index at which item was found: "

.text
main: 
    li $v0, 4
    la $a0, msg0
    syscall
    
    la $a0, array

    li $v0, 5
    syscall

    move $a1, $v0
    lw $a2, length
    li $t0, 0

loop:
    bge $t0, $a2, NotFound
    lw $t1, 0($a0)
    beq $t1, $a1, Found
    addi $a0, $a0, 4
    addi $t0, $t0, 1 
    j loop

Found: 
    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 1 
    add $a0, $t0, $0
    syscall

    j exit

NotFound:
    li $v0, 4
    la $a0, msg1
    syscall

exit: 
    li $v0, 10
    syscall


