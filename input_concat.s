.data
msg1: .asciiz "Enter the first strring: "
msg2: .asciiz "Enter the second strring: "
str1: .space 256
str2: .space 256
endline: .asciiz "\n"
concat_str: .space 512
.text
.globl main

main:
    li $v0, 4
    la $a0,msg1
    syscall

    li $v0, 8
    la $a0, str1
    li $a1, 256
    syscall

    li $v0, 4
    la $a0,msg2
    syscall

    li $v0, 8
    la $a0, str2
    li $a1, 256
    syscall

    la $t3, concat_str # get concat_str address
    #### Loop to add all elements of str1
    la $t4, str1 # get str1 address
    # start loop at i = 0
    li $t2, 0 # set loop counter
    lb $t7, endline 
    
str1_loop:
    lb $t1, 0($t4) # load t1 = str1[i]
    beq $t1, $t7, str1_loop_end # check for str1 end
    sb $t1, 0($t3) # store concat_str[i] = t1
    addi $t2, $t2, 1 # advance loop counter
    addi $t3, $t3, 1 # advance concat_str ptr
    addi $t4, $t4, 1 # advance str1 ptr
    j str1_loop # repeat the loop
    
str1_loop_end:
    #### Loop to add all elements of str2
    la $t4, str2 # get str2 address
    # start loop at j = 0
    li $t2, 0 # set loop counter
    
str2_loop:
    lb $t1, 0($t4) # load t1 = str2[j]
    beqz $t1, str2_loop_end # check for str1 end
    sb $t1, 0($t3) # store concat_str[i + j] = t1
    addi $t2, $t2, 1 # advance loop counter
    addi $t3, $t3, 1 # advance concat_str ptr
    addi $t4, $t4, 1 # advance str2 ptr
    j str2_loop # repeat the loop
    
str2_loop_end:
    li $v0, 4
    la $a0, concat_str
    syscall
    
    li $v0,10
    syscall
    .end main