.data

.text
main:

li $t0, 100
li $t1, 200

sw $t0, 80($zero)
sw $t1, 160($zero)

lw $t2, 80($zero)
lw $t3, 160($zero)

li $v0, 1
move $a0, $t2
syscall
li $v0, 1 
move $a0, $t3
syscall
li $v0, 10
syscall