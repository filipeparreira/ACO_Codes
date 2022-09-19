.data
	msg: .asciiz "O vetor resultante é: "
	vet1: .word 5, 10, 15, 20, 25, 30, 35, 40
	vet2: .word 0, 10, -15, 16, 20, 30, 40, 50
	vet3: .word 0, 0, 0, 0, 0, 0, 0, 0 
	space: .byte ' '
	
.text
main:
	WhileSoma:
		bge $t0, 8, ImprimeMsg
		lw $s0, vet1($t1)
		lw $s1, vet2($t1)
		add $s2, $s0, $s1
		sw $s2, vet3($t1)
		addi $t0, $t0, 1
		addi $t1, $t1, 4
		j WhileSoma
	ImprimeMsg:
		li $v0, 4
		la $a0, msg
		syscall
		j WhileImprime
	
	WhileImprime:
		bge $t2, 8, Sair
		lw $s2, vet3($t3)
		li $v0, 1
		move $a0, $s2
		syscall
		li $v0, 4
		la $a0, space
		syscall
		addi $t2, $t2, 1
		addi $t3, $t3, 4
		j WhileImprime
	
	Sair:
		li $v0, 10
		syscall 
