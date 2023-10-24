.data
str: .asciiz "Ansh Choudhary"
msg1: .asciiz "Reversed String : "
rev_str: .space 256			#allocating 256 character of memory for the string 

.text
.globl main       
main:
    la $t4, str                         # get str address
                                        # start loop at i = 0
    li $t2, 0                           # set loop counter

len_loop:
    lb $t1, 0($t4)                      # load str[i]
    beqz $t1, len_loop_end              # check for str end

    addi $t2, $t2, 1                    # advance loop counter
    addi $t4, $t4, 1                    # advance str ptr

    j len_loop                          # repeat the loop

len_loop_end:
    addi $t4, $t4, -1                   # reduce str ptr

    la $t5, rev_str                     # get rev str address

                                        # start loop at j = 0
    li $t0, 0                           # set loop counter

rev_loop:
    beq $t0, $t2, rev_loop_end          # iterate for t2 iters

    lb $t1, 0($t4)                      # load t1 = str[i]
    sb $t1, 0($t5)                      # store rev_str[j] = t1

    addi $t0, $t0, 1                    # advance loop counter
    addi $t4, $t4, -1                   # reduce str ptr
    addi $t5, $t5, 1                    # advance rev_str ptr

    j rev_loop                          # repeat the loop

rev_loop_end:
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 4
    la $a0, rev_str
    syscall

    li $v0,10
    syscall
    .end main
