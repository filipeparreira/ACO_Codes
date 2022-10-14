.data
	str1: .space 100
	str2: .space 100
.text
	li $v0, 8
	la $a0, str1
	li $a1, 100
	syscall
	
	li $v0, 8
	la $a0, str2
	li $a1, 100
	syscall
	
	la $a0, str1
	la $a1, str2
	
	jal StrCmp
	
	move $a0, $v0
	
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
	#Implementar a função StrCmp, ela recebe duas strings e as comparam, se forem iguais retorna 0,
	#se a string1 for maior que a string2, retorna 1, se for menor retorna -1
	StrCmp:
		li $t0, 0
		li $t1, 0
		
		ValStr1:
		lb $t2, 0($a0)
		add $t0, $t0, $t2
		addi $a0, $a0, 1
		bne $t2, 10, ValStr1
		
		ValStr2:
		lb $t2, 0($a1)
		add $t1, $t1, $t2
		addi $a1, $a1, 1
		bne $t2, 10, ValStr2
		
		sub $v0, $t0, $t1
		jr $ra
		
			
