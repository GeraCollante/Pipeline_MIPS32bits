	jal SUB
	nop
	addu $t6, $a0, $v0
SUB:	lui $a0, 3
	addu $v1, $at, $a3
	hlt
