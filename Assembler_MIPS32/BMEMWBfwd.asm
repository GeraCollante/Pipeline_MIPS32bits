addu 	$v0, $a2, $v1
and 	$v1, $a0, $a1
or 	$at, $a2, $a3
beq	$a1, $v0, 1
lw 	$t0, 2($a3)
hlt
