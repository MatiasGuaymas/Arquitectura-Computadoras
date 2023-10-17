	.data
A: 	        .word 2
B: 	        .word 3
C: 	        .word 1
D: 	        .word 0

	.code
#PRESTAR ATENCION DE NO USAR DELAY SLOT, CAMBIA TODO EL PROGRAMA!
		    ld r1, A(r0)
		    ld r2, B(r0)
		    ld r3, C(r0)
		    bne r1, r2, no_Igual1
		    daddi r4, r0, 1
no_Igual1:  bne r1, r3, no_Igual2
		    daddi r4, r4, 1
		    j fin
no_Igual2:  bne r2, r3, fin
            daddi r4, r0, 1
fin:        beqz r4, terminado
            daddi r4, r4, 1
terminado:  sd r4, D(r0)
halt