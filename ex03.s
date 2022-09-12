.data

.text
main:

li $t0, 5
li $t1, 20

sw $t0, 40($zero)
sw $t1, 160($zero)

lw $t2, 40($zero)
lw $t3, 160($zero)

add  $t2, $t2, $t3 

sw $t2, 400($zero)

lw $s0, 400($zero)

li $v0, 1
move $a0, $s0
syscall
li $v0, 10
syscall