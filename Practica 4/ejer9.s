	.data
A:	    .word 5
X:	    .word 0
Y:	    .word 3

	.code
		ld r1, A(r0)
		ld r2, X(r0)
		ld r3, Y(r0)
	#CON DELAY SHOT, Y DADDI ABAJO DE BEQZ, X = F y R1= TODOS F -> 5x3
	#CON DELAY SHOT, Y DADD ABAJO DE BEQZ, X = 12 y R1= TODOS 0 -> 4x3
LOOP:	beqz r1, FIN
		dadd r2, r2, r3
		daddi r1, r1, -1
		j LOOP
FIN:    sd r2, X(r0)
halt