    .data
N1:     .word 5
N2:     .word 4
RES:    .word 0
	
	.code
		ld r1, N1(r0)
		ld r2, N2(r0)
		dadd r10, r0, r0
LOOP:   daddi r2, r2, -1
		bnez r2, LOOP
		dadd r10, r10, r1
		sd r10, RES(r0)
halt