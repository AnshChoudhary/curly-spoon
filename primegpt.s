.data
    prompt:     .asciiz "Enter an integer: "
    not_prime:  .asciiz "The number is not prime."
    prime:      .asciiz "The number is prime."

.text
.globl main

main:
    # Print prompt message
    li $v0, 4
    la $a0, prompt
    syscall

    # Read an integer from user
    li $v0, 5
    syscall
    move $t0, $v0    # Store input number in $t0

    # Check if the number is less than 2
    blez $t0, no

    # Check for divisibility from 2 to sqrt(number)
    li $t1, 2          # $t1 = divisor
    loop:
        mul $t2, $t1, $t1  # $t2 = divisor * divisor
        bge $t2, $t0, prime  # If divisor * divisor >= number, the number is prime
        div $t0, $t1        # Divide number by divisor
        mfhi $t3            # $t3 = remainder
        beqz $t3, no # If remainder is 0, the number is not prime
        addi $t1, $t1, 1    # Increment divisor
        j loop

no:
    # Print not prime message
    li $v0, 4
    la $a0, not_prime
    syscall
    j end

prime:
    # Print prime message
    li $v0, 4
    la $a0, prime
    syscall

end:
    # Exit program
    li $v0, 10
    syscall