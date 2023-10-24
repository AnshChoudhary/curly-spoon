.data
str: .asciiz "Ansh"
msg1: .asciiz "Reversed String: "
new_line: .asciiz "\n"
rev_str: .space 256

.text
.globl main

main: 
    la $t4, str
    li $t0, 0

len_loop:
    lb $t1, 0($t4)
    beqz $t1, len_loop_end 
    addi $t0, $t0, 1
    addi $t4, $t4, 1
    j len_loop

len_loop_end:
    addi $t4, $t4, -1

    la $t5, rev_str
    li $t3, 0

rev_loop: 
    beq $t3, $t0, end
    lb $t1, 0($t4)
    sb $t1, 0($t5)

    addi $t3, $t3, 1
    addi $t5, $t5, 1
    addi $t4, $t4, -1

    j rev_loop

end: 
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 4
    la $a0, rev_str
    syscall

    li $v0, 10
    syscall

