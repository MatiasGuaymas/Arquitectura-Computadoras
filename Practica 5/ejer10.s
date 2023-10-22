	    .data
CAD:	.ascii	"MatuteGuaymas"
VOC:	.asciiz "AEIOUaeiou"
RES:	.word 0

	    .code
	    daddi $sp, $0, 0x400	    ; Inicializo el SP para usar la pila
	    daddi $a0, $0, CAD	        ; $a0 = OFFSET CAD (direccion de comienzo de la cadena CAD)
	    jal CANT_VOC		        ; Salto a la subrutina CANT_VOC y guardo en $ra, la direccion de retorno de la subrutina
	    sd $v0, RES($0)		        ; Guardo el valor de retorno contenido en $v0 de la subrutina en RES
	    halt			            ; Fin del programa
	
CANT_VOC: daddi $sp, $sp, -16	    ; Reservo lugar en la pila para hacer un PUSH, 2x8 = 16
	    sd $ra, 0($sp)		        ; Guardo en la pila $ra
	    sd $s0, 8($sp)		        ; Guardo en la pila $s0
	    dadd $s0, $a0, $0	        ; Copio la direccion de inicio de la cadena CAD, para luego ir haciendo desplazamientos
LOOP:	lbu $a0, 0($s0)		        ; Cargo en $a0 la direccion de comienzo de CAD, empezando por el primer caracter
	    beq $a0, $zero, FIN	        ; Salto a FIN si mi cadena llego a su fin
	    jal ES_VOC		            ; Salto a ES_VOC para verificar si el caracter actual es una vocal. Multiples subrutinas, por eso guardo el $ra
	    daddi $s0, $s0, 1	        ; Avanzo al siguiente caracter
	    j LOOP			            ; Sigo loopeando hasta terminar con la cadena
FIN:	ld $ra, 0($sp)		        ; Recupero los datos salvados en la pila, haciendo un POP. En esta linea recupero el $ra para poder volver al programa principal
	    ld $s0, 8($sp)		        ; Recupero mi desplazamiento, (0)
	    daddi $sp, $sp, 16	        ; Dejo el SP apuntando a la direccion de comienzo de la pila
	    jr $ra			            ; Vuelvo al programa principal

ES_VOC: daddi $t0, $0, 0      	    ; Inicializo $t0 en 0, lo voy a usar para desplazarme por la tabla de vocales
LOOP2: 	lbu $t1, VOC($t0)    	    ; Cargo en $t1 la direccion de comienzo de VOC, es decir cargo el primer elemento de la tabla de vocales
        beqz $t1, FINVOCAL          ; Salto a FINVOCAL si mi arreglo de vocales llego a su fin, es decir que no se encontraron vocales
        beq $a0, $t1, SI_VOC  	    ; Salto a SI_VOC si vocalActual = caracterActual
        daddi $t0, $t0, 1           ; Avanzo al siguiente elemento de VOC
    	j LOOP2			            ; Sigo loopeando hasta terminar con la cadena de vocales
SI_VOC: daddi $v0, $v0, 1      	    ; El caracter era una vocal, por ende sumo $v0 en 1
FINVOCAL: jr $ra               	    ; Vuelvo a la subrutina LOOP