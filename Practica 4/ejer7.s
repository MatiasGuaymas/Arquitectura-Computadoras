	.data
TABLA:	.word  1, 7, 8, 2, 5, 10, 13, 3, 9, 11
RES:	.word  0, 0, 0, 0, 0, 0,  0,  0, 0, 0
X:		.word  7
LONG:	.word  10
CANT:	.word  0

	.code
		ld r1, LONG(r0)
		ld r2, X(r0)
		dadd r3, r0, r0
		dadd r5, r0, r0
		daddi r8, r0, 1
LOOP:   ld r4, TABLA(r3)
		slt r6, r4, r2
		bnez r6, MENOR
		dsub r7, r4, r2
		beqz r7, MENOR
		sd r8, RES(r3)
		daddi r5, r5, 1
MENOR:  daddi r3, r3, 8
		daddi r1, r1, -1
		bnez r1, LOOP
		sd r5, CANT(r0)
halt