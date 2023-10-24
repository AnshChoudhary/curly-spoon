.data
str: .asciiz "ANSH"
msg1: .asciiz "Reversed String: "
rev_str: .space 256

.text 
.globl main

main: 
    la $t4, str

    li $t0, 0   #counter

len_loop: 
    lb $t2, 0($t4)
    beqz $t2, len_loop_end

    addi $t0, $t0, 1
    addi $t4, $t4, 1
    j len_loop

len_loop_end:
    addi $t4, $t4, -1

    la $t3, rev_str
    li $t1, 0

rev_loop:   
    beq $t1, $t0, rev_loop_end

    lb $t2, 0($t4)
    sb $t2, 0($t3)

    addi $t1, $t1, 1
    addi $t4, $t4, -1
    addi $t3, $t3, 1

    j rev_loop

rev_loop_end:
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 4
    la $a0, rev_str
    syscall

    li $v0, 10
    syscall