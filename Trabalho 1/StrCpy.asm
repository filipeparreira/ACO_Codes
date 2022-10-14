.data
	str1: .asciiz "Abacate"
	str2: .asciiz "Queijo"
.text
	la $a0, str1
	la $a1, str2
	
	jal StrCpy
	
	li $v0, 4
	la $a0, str1
	syscall
	
	li $v0, 10
	syscall 
	

	#Implementar a função StrCpy, que copia uma string2 para outra string1, não retorna nada
	StrCpy:
		lb $t0, 0($a0) 
		sb $zero, 0($a0)
		addi $a0, $a0, 1
		addi $t1, $t1, 1
		bne $t0, $zero, StrCpy
		sub $a0, $a0, $t1
		Copia:
			lb $t2, 0($a1)
			sb $t2, 0($a0)
			addi $a1, $a1, 1
			addi $a0, $a0, 1
			beq $t2, $zero, Sair
			j Copia
		Sair:
			jr $ra
		