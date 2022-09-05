.data

.text
main:

li, $v0, 5
syscall
move $t0, $v0

li, $v0, 5
syscall
move $t1, $v0

addi, $t3, -111


slt $t2, $t0, $t1
	bne $t2, $zero, Diferentes
	beq $t0, $t1, Else
	li $v0, 1
	move $a0, $t0
	syscall
	li $v0, 10
	syscall	
		
Diferentes:
	beq $t0, $t1, Else
	li $v0, 1
	move $a0, $t1
	syscall
	li $v0, 10
	syscall	

Else:
	li $v0, 1
	move $a0, $t3
	syscall
	li $v0, 10
	syscall
