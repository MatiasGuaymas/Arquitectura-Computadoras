                .data
coorX:          .byte 0
coorY:          .byte 0
color:          .byte 0, 0, 0, 0; 
CONTROL:        .word32 0x10000
DATA:           .word32 0x10008
MSG1:           .asciiz "Ingrese X: \n"
MSG2:           .asciiz "Ingrese Y: \n"
MSG3:           .asciiz "Ingrese RGBA: \n"

                .text
                lwu $s6, CONTROL($zero) 
                lwu $s7, DATA($zero)
                daddi $t0, $0, MSG1         ; Voy a imprimir el string MSG1
                sd $t0, 0 ($s7) 
                daddi $t1, $0, 4 
                sd $t1, 0 ($s6) 
                daddi $t1, $0, 8            ; Voy a leer X
                sb $t1, 0($s6)              
                lbu $t2, 0($s7) 
                sb $t2, coorX($0)

                daddi $t0, $0, MSG2         ; Voy a imprimir el string MSG2
                sd $t0, 0 ($s7) 
                daddi $t1, $0, 4 
                sd $t1, 0 ($s6) 
                daddi $t1, $0, 8            ; Voy a leer Y
                sb $t1, 0($s6) 
                lbu $t3, 0($s7) 
                sb $t3, coorY($0)

                daddi $t0, $0, MSG3         ; Voy a imprimir el string MSG3
                sd $t0, 0 ($s7)
                daddi $t1, $0, 4 
                sd $t1, 0 ($s6)

                daddi $a0, $0, 0            ; Contadores para leer
                daddi $a1, $0, 4
    
LOOP:           daddi $t1, $0, 8
                sb $t1, 0($s6) 
                lbu $t3, 0($s7) 
                sb $t3, color($a0)
                daddi $a0, $a0, 1           ; Avanzo al siguiente byte de la cadena
                bne $a0, $a1 , LOOP

                daddi $t0, $zero, 7
                sd $t0, 0($s6)
                lbu $s0, coorX($zero)
                sb $s0, 5($s7)
                lbu $s1, coorY($zero)
                sb $s1, 4($s7)
                lwu $s2, color($zero)
                sw $s2, 0($s7)
                daddi $t0, $zero, 5
                sd $t0, 0($s6)         
                halt