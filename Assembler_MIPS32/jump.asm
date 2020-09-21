	jal sub
	nop
sub:	lui $t0, 4097
	addu $t1, $a0, $v0
	subu $t0, $a0, $a3
	and $a0, $v0, $a1
	jr $ra
	nop