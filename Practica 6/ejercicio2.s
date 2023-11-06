                .data 
DATA:           .word 0x10008
CONTROL:        .word 0x10000
ERROR:          .asciiz "ERROR"
CERO:           .asciiz "CERO"
UNO:            .asciiz "UNO"
DOS:            .asciiz "DOS"
TRES:           .asciiz "TRES"
CUATRO:         .asciiz "CUATRO"
CINCO:          .asciiz "CINCO"
SEIS:           .asciiz "SEIS"
SIETE:          .asciiz "SIETE"
OCHO:           .asciiz "OCHO"
NUEVE:          .asciiz "NUEVE"

                .text
                lwu $s0,  CONTROL($0) 
                lwu $s1, DATA($0)

                jal ingreso 
                dadd $a0, $zero, $v0
                jal muestra 
                halt 

ingreso:        daddi $t0, $zero, 8
                sd $t0, 0($s0) 
                ld $t0, 0($s1)
                slti $t1, $t0, 10
                bnez $t1, okay
                daddi $v0, $0, -1 
                jr $ra 
okay:           dadd $v0, $zero, $t0
                jr $ra 

muestra:        daddi $t8, $t8, 8
                dmul $a0, $a0, $t8
                daddi $t1, $a0, CERO 
                sd $t1, 0($s1) 
                daddi $t2, $zero, 4
                sd $t2, 0($s0)
                jr $ra