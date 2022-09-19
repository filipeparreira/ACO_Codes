.data
	msg1: .asciiz "Digite o primeiro valor: "
	msg2: .asciiz "Digite o segundo valor: "
.text
main:
	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 5
	syscall
	move $s0, $v0
	
	li $v0, 4
	la $a0, msg2
	syscall
	li $v0, 5
	syscall
	move $s1, $v0
	
	bne $s0, $s1, Maiores
		li $t0, -111
		li $v0, 1
		move $a0, $t0
		syscall
		li $v0, 10
		syscall
	Maiores:
		bgt $s0, $s1, MaiorS0
		li $v0, 1
		move $a0, $s1
		syscall
		li $v0, 10
		syscall
	MaiorS0:
		li $v0, 1
		move $a0, $s0
		syscall
		li $v0, 10
		syscall
		
	
	
