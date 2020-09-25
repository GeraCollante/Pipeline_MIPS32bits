	jal SUB
	ori $t2, $t1, 1
	sll $v0, $at, 2
	addu $t6, $a0, $v0
	hlt
SUB:	lui $a0, 3
	addu $v1, $at, $a3
	jr $ra
