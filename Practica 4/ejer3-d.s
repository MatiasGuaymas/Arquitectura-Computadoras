    .data
A:      .word 1
B:      .word 3
C:      .word 0, 0, 0

# Los elementos en la tabla, hacen referencia al numero decimal
# que representa antes de los corrimientos.

    .code
        ld r2, B(r0)
        ld r1, A(r0)
        daddi r3, r0, 0
loop:   sd r1, C(r3)
        dsll r1, r1, 1
        daddi r2, r2, -1
        daddi r3, r3, 8
        bnez r2, loop
halt
