                .data
CONTROL:        .word 0x10000
DATA:           .word 0x10008
BASE:           .word 0.0
EXP:            .word 0
MSG:            .asciiz "BASE en Flotante: \n"
MSG2:           .asciiz "EXPONENTE en BSS: \n"
RES:            .double 0
UNO:            .double 1.0

                .text
                lwu $s0, CONTROL($0)
                lwu $s1, DATA($0)
                daddi $t0, $0, MSG
                sd $t0, 0($s1)
                daddi $t4, $0, 4
                sd $t4, 0($s0)
                daddi $t0, $zero, 8
                sd $t0, 0($s0)
                l.d f1, 0($s1)
                s.d f1, BASE($zero)

                daddi $t0, $0, MSG2
                sd $t0, 0($s1)
                sd $t4, 0($s0)
                daddi $t0, $zero, 8
                sd $t0, 0($s0)
                ld $a0, 0($s1)
                sd $a0, EXP($zero)

                jal A_LA_POTENCIA
                s.d f2, RES($0)
                s.d f2, 0($s1)
                daddi $t0, $0, 3
                sd $t0, 0($s0)
                halt

A_LA_POTENCIA:  l.d f2, UNO($0)
LOOP:           beqz $a0, FIN
                mul.d f2, f2, f1
                daddi $a0, $a0, -1
                j LOOP
FIN:            jr $ra
