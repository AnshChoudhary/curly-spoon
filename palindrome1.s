.data 
str: .asciiz "malayaslam"
msg1: .asciiz "Palindrome."
msg2: .asciiz "Not Palindrome."

.text
.globl main

main: 
    la $t0, str
    li $t1, 0

len_loop:
    lb $t2, 0($t0)
    beqz $t2, len_loop_end
    addi $t1, $t1, 1
    addi $t0, $t0, 1

    j len_loop

len_loop_end:
    addi $t0, $t0, -1

    la $t3, str

    li $t4, 0       #counter
    li $t5, 0       #boolean = 1 when string is palindrome.

rev_loop:
    beq $t4, $t1, palindrome
    lb $t2, 0($t0)
    sb $t6, 0($t3)

    beq $t2, $t6, isEqual

    li $t5, 0
    j palindrome 

    isEqual:
        addi $t4, $t4, 1
        addi $t0, $t0, -1
        addi $t3, $t3, 1
        j rev_loop

palindrome: 
    beq $t7, $zero, not_palindrome

    li $v0, 4
    la $a0, msg1
    syscall

    j end

not_palindrome:
    li $v0, 4
    la $a0, msg1
    syscall

end:
    li $v0, 10
    syscall