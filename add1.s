.data
msg1: .asciiz "Enter number until you want to add: "
msg2: .asciiz "Result: "

.text 
main: 
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5           # store input value. example: 5
    syscall

    move $t1, $v0        # t1 = 5, counter var

    li $t0, 0           # t0 = 0
    li $t2, 0              #t2 = 0

loop: 
    beq $t0, $t1, exit      # exits when t1 == t0
    addi $t0, $t0, 1        # increments t0
    add $t2, $t2, $t0       # adds 
    j loop

exit: 
    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 10
    syscall
