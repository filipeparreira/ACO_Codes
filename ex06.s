.data

.text
main:

li $t2, -111

li $v0, 5
syscall
move $t0, $v0

li $v0, 5
syscall
move $t1, $v0

slt $s2, $t0, $t1
slt $s3, $t1, $t0
beq $t0, $t1, Else
beq $s2, $zero, Maior1
beq $s3, $zero, Maior2


Maior1:
	li $v0, 1
	move $a0, $t0
	syscall
	li $v0, 10
	syscall

Maior2:
	li $v0, 1
	move $a0, $t1
	syscall
	li $v0, 10
	syscall	

Else:
	
	li $v0, 1
	move $a0, $t2
	syscall
	li $v0, 10
	syscall
	
