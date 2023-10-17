	    .data
cadena:     .asciiz  "adbdcdedfdgdhdid"
car:        .asciiz  "d"
cant:       .word     0
		
	#SIN DELAY SHOT
	    .code
		    dadd r1, r0, r0
		    dadd r2, r0, r0
		    dadd r6, r0, r0
		    lbu r3, car(r0)
LOOP:	    lbu r4, cadena(r1)
		    beqz r4, FIN
		    dsub r5, r4, r3
		    bnez r5, DISTINTOS
		    daddi r6, r6, 1
DISTINTOS:  daddi r1, r1, 1
		    j LOOP
FIN:        sd r6, cant(r0)
halt 