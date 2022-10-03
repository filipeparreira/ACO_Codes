.data
	msg: .asciiz "Digite um numero inteiro: "
	msg2: .asciiz "Digite outro numero inteiro: "
	
.text
main:
	li $v0, 4
	la $a0, msg
	syscall
	li $v0, 5
	syscall
	move $a0, $a0
	
	li $v0, 4
	la $a0, msg2
	syscall
	li $v0, 5
	syscall
	move $a1, $a0
	

	li $v0, 1
	move $a0, $a0
	syscall
	li $v0, 1
	move $a0, $a1
	syscall
	li $v0, 10
	syscall
