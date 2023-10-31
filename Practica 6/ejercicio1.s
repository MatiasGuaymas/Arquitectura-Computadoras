                .data
DIR_CONTROL:    .word 0x10000
DIR_DATA:       .word 0x10008
str:            .asciiz ""
                
                .text
                ld $t6, DIR_CONTROL($0)
                ld $t7, DIR_DATA($0)
                daddi $t0, $0, 9
                daddi $t2, $0, 0
                daddi $t3, $0, 12
                daddi $t9, $0, 33
loop:           sd $t0, 0($t6)
                lbu $t1, 0($t7)
                sb $t1, str($t2)
                beq $t1, $t9, imprimir
                daddi $t2, $t2, 1
                daddi $t3, $t3, -1
                bnez $t3, loop
imprimir:       daddi $t4, $0, str
                sd $t4, 0($t7)
                daddi $t5, $0, 4
                sd $t5, 0($t6)
                halt