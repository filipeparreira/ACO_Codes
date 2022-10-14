.data
	string1: .space 10
	string2: .space 10
	espaco: .byte '\n'
.text
	li $v0, 8
	la $a0, string1
	li $a1, 10
	syscall
	
	li $v0, 8
	la $a0, string2
	li $a1, 10
	syscall
	
	la $a0, string1
	la $a1, string2
	jal StrCat
	
	li $v0, 4
	la $a0, espaco
	syscall
	
	li $v0, 4
	la $a0, string1
	syscall
	
	li $v0, 10
	syscall
	
	#Implementar a função StrCat, que concatena a string1 e a string2 colocando tudo na string1
	StrCat:
		addi $t1, $t1, 1
		lb $t0, 0($a0)
		addi $a0, $a0, 1
		bne $t0, $zero, StrCat
	
		subi $a0, $a0, 2
	
		Concatena:
			lb $t0, 0($a1)
			sb $t0, 0($a0)
			addi $a1, $a1, 1
			addi $a0, $a0, 1
			beq $t0, $zero, SairStrCat
			j Concatena
		SairStrCat:
			jr $ra	
		
