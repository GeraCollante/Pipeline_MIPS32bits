and 	$v1, $at, $t0
addu 	$a1, $a0, $a1
or 	$v0, $a2, $a3
beq	$v0, $a3, 1
lw 	$t0, 2($a3)
hlt
