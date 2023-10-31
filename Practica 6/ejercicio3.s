                .data
CONTROL:        .word32  0x10000
DATA:           .word32  0x10008
RESULTADO:      .asciiz  "00"

                .text
                lwu    $a0, DATA($zero)
                daddi  $a1, $zero, 9
                lwu    $a2, CONTROL($zero)
                daddi  $a3, $zero, 4
                jal    ingre
                dadd   $v1, $v0, $zero
                jal    ingre
                jal    resul
                halt

ingre:          sd   $a1, ($a2)
                lbu  $v0, ($a0)
                daddi  $v0, $v0, - 0x30
                dadd  $t2, $v0, $zero
                slti  $t3, $t2, 0
                bnez  $t3, ingre
                daddui $t2, $t2, - 10
                slti  $t3, $t2, 0 
                beqz  $t3, ingre
                jr   $ra

resul:          dadd   $v0, $v0, $v1
                slti   $t5, $v0, 10
                bnez  $t5, un_digito
                daddi $v0, $v0, -10
                dadd  $t7, $zero, $zero
                daddi $t8, $zero, 0x31
                sb    $t8, RESULTADO($t7)
                daddi $t7, $t7, 1
                daddi $v0, $v0, 0x30
                sb    $v0, RESULTADO($t7)
                j     afuera

un_digito:      daddi  $t7, $zero, 1
                daddi  $v0, $v0, 0x30
                sb     $v0, RESULTADO($t7)

afuera:         daddi  $t4,  $zero, RESULTADO
                sd     $t4, ($a0)
                sd     $a3, ($a2)
                jr     $ra