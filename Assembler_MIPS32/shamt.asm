sll $v0, $at, 2
srl $v0, $a2, 1
sra $v1, $a0, 1
sllv $t1, $a3, $at
srlv $a2, $t0, $at
srav $a0, $v1, $at
slt $t2, $at, $v0
hlt
