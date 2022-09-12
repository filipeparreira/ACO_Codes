.data 

.text
main:

li $v0, 5
syscall
move $t0, $v0

li $v0, 5
syscall
move $t1, $v0

slt $s2, $t0, $zero
slt $s3, $t1, $zero 
bne $s1, $zero, MultipliqueM 

Multiplique:
	beq $t1, $zero, Else
	addi $t1, $t1, -1
	add $s0, $s0, $t0
	j Multiplique
	
Else:
	li $v0, 1
	move $a0, $s0
	syscall
	li $v0, 10
	syscall 
