and 	$v1, $at, $t0
addu 	$v0, $a0, $a1
or 	$at, $a2, $a3
bne	$v0, $t0, 1
lw 	$t0, 2($a3)
hlt
