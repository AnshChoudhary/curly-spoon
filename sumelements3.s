.data
msg1: .asciiz " "
array_a: .word 1, 2, 3, 4, 5
array_b: .word 1, 2, 3, 4, 5
array_c: .space 20 # 5 * 4
size: .word 5

.text
.globl main     
main:

lw $t3, size
la $t4, array_a # get array address
la $t5, array_b # get array address
la $t6, array_c # get array address
li $t2, 0 # set loop counter

# loop prints all values in X as example
print_loop:
beq $t2, $t3, print_loop_end # check for array end

lw $t0, ($t4) # load a[i]
lw $t1, ($t5) # load b[i]

add $t0, $t0, $t1 # t0 = a[i] + b[i]

sw $t0, ($t6) # c[i] = t0 = a[i] + b[i]

lw $t0, ($t6) # load c[i]
#pint c[i]
li $v0, 1
move $a0, $t0
syscall 

li $v0, 4
la $a0, msg1
syscall

addi $t2, $t2, 1 # advance loop counter
addi $t4, $t4, 4 # advance array pointer
addi $t5, $t5, 4 # advance array pointer
addi $t6, $t6, 4 # advance array pointer

j print_loop # repeat the loop
print_loop_end:

li $v0,10
syscall
