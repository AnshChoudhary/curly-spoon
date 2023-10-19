.data
msg1: .asciiz "Enter a : "
msg2: .asciiz "Enter b : "
msg3: .asciiz "Enter c : "
msg4: .asciiz "Result d : "

.text
main: li $v0, 4
la $a0, msg1
syscall

li $v0, 5
syscall

move $t1, $v0

li $v0, 4
la $a0, msg2
syscall

li $v0, 5
syscall

move $t2, $v0

li $v0, 4
la $a0, msg3
syscall

li $v0, 5
syscall

move $t3, $v0
add $t1, $t1, $t2
sub $t3, $t1, $t3
li $v0, 4
la $a0, msg4
syscall

li $v0, 1
move $a0, $t3
syscall

li $v0, 10
syscall
