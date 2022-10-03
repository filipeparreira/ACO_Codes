.data 

	msg: .asciiz "Resultado: "

.text

main:

	li $v0, 5
	syscall
	move $a0, $v0
	jal Somador
	
	move $t0, $v0
	
	li $v1, 4
	la $a0, msg
	syscall
	
	move $a0, $t0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
Somador:

	addi $sp, $sp, -8
	sw $a0, 4($sp)
	sw $ra, 8($sp)
	
	slti $t0, $a0, 1
	beq $t0, $zero, L1
	
	li $v0, 1
    	addi $sp, $sp, 8
    	jr $ra   

L1:
	
	addi $a0, $a0, -1
    	jal Somador

    	lw $a0, 4($sp)
    	lw $ra, 8($sp)
    	addi $sp, $sp, 8

 	add $v0, $v0, $a0
  
 	jr $ra
