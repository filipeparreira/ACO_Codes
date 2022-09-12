.data

.text
main:

li $t0, 10 
li $t1, 20

addi $s0, $t0, 4
addi $s1, $t1, -6
sub $t3, $s0, $s1

li $v0, 1
move $a0, $t3
syscall
li $v0, 10
syscall