.data

.text
main:

#f = (g + h) - (i + j)

addi $t0, $t0, 1  #g = 1
addi $t1, $t1, 3  #h = 3
addi $t3, $t3, 2  #i = 2
addi $t4, $t4, 5  #j = 5

add $t0, $t0, $t1 #g = g + h 
add $t3, $t3, $t4 #i = i + j
sub $s1, $t0, $t3 #f = g - i

li $v0, 1
move $a0, $s1
syscall
li $v0, 10 
syscall

 