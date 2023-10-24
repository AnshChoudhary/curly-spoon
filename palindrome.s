.data
str: .asciiz "lloll"
msg1: .asciiz "Is a palindrome."
msg2: .asciiz "Is not a palindrome."

.text
.globl main     

main:
    la $t4, str                     # get str address
                                    # start loop at i = 0
    li $t2, 0                       # set loop counter

len_loop:
    lb $t1, 0($t4)                  # load str[i]

    beqz $t1, len_loop_end          # check for str end


    addi $t2, $t2, 1                # advance loop counter
    addi $t4, $t4, 1                # advance str ptr

    j len_loop                      # repeat the loop

len_loop_end:
    addi $t4, $t4, -1               # reduce str ptr


    la $t5, str                     # get str address

    # start loop at j = 0
    li $t0, 0                       # set loop counter

    li $t7, 1                       # bool t7 = 1 (true if the string is a palindrome)

rev_loop:
    beq $t0, $t2, palindrome      # iterate for t2 iters

    lb $t1, 0($t4)                  # load t1 = str[i]
    lb $t6, 0($t5)                  # load t6 = str[j]

    beq $t1, $t6, isEqual
    # if not equal, string is not a palindrome
    # so we set t7 = 0 and break from the loop
    li $t7, 0
    j palindrome                  # break
    
    isEqual:
        addi $t0, $t0, 1                # advance loop counter
        addi $t4, $t4, -1               # reduce t4 str ptr (reverse direction)
        addi $t5, $t5, 1                # advance t5 str ptr (forwards direction)

    j rev_loop                      # repeat the loop

palindrome:
    beq $t7, $zero, not_palindrome

    li $v0, 4
    la $a0, msg1
    syscall
    j end

not_palindrome:
    li $v0, 4
    la $a0, msg2
    syscall

end:
    li $v0,10
    syscall
    .end main
