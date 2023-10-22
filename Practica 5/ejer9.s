	    .data
LETRA:	.ascii	"U"
VOC:	.asciiz "AEIOUaeiou"
RES:	.word 0

	    .code
	    lbu $a0, LETRA($0)	    ; $a0 = "U"
	    jal ES_VOC		        ; Salto a la subrutina ES_VOCAL y guardo en $ra, la direccion de retorno de la subrutina
	    sd $v0, RES($0)		    ; Guardo el valor de retorno contenido en $v0 de la subrutina en RES
	    halt			        ; Fin del programa
	
ES_VOC: dadd $v0, $0, $0	    ; Inicializo $v0 en 0, en caso de que retorne el mismo valor, significa que mi LETRA no es vocal
	    daddi $t0, $0, 0	    ; Inicializo $t0 en 0, lo voy a usar para desplazarme por la tabla de vocales
LOOP:	lbu $t1, VOC($t0)	    ; Cargo en $t1 la direccion de comienzo de VOC, es decir cargo el primer elemento de la tabla de vocales
	    beqz $t1, FIN		    ; Salto a FIN si mi arreglo de vocales llego a su fin
	    beq $a0, $t1, SI_VOC	; Salto a SI_VOC si la letra pasada por argumento es una vocal
	    daddi $t0, $t0, 1	    ; Avanzo al siguiente elemento de VOC
	    j LOOP			        ; Como la letra no coincide con la vocal de la posicion actual sigo loopeando
SI_VOC: daddi $v0, $0, 1	    ; El caracter era una vocal, por ende sumo $v0 en 1
FIN:	jr $ra			        ; Vuelvo al programa principal