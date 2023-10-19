.data
msg1: .asciiz "Enter a Number untill which you want to add: "
msg2: .asciiz "Result: "
.text
.globl main
main: li $v0, 4
la $a0, msg1
syscall
li $v0, 5
syscall
move $t1, $v0
li $t0,0
li $t2,0

loop:
beq $t0,$t1,exit
addi $t0,$t0,1
add $t2,$t2,$t0
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
