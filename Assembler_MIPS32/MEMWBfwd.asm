addu 	$v0, $a3, $v1
and 	$v1, $a0, $a1
or 	$at, $a2, $a3
bne	$v0, $a0, 1
lw 	$t0, 2($a3)
hlt
