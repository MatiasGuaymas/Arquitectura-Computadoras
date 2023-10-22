	    .data
TABLA:	.word 1, 2, 3, 4, 5, 6, 7, 0
IMP:	.word 0
MASK:	.byte 00000001

	    .code
	    daddi $sp, $0, 0x400        ; Inicializo el SP para usar la pila
	    ld $a0, TABLA($0)           ; $a0 = OFFSET TABLA (direccion de comienzo de TABLA)
	    jal CANT_IMP		        ; Salto a la subrutina CANT_IMPARES y guardo en $ra la direccion de retorno de la suburutina
	    sd $v1, IMP($s0)	        ; Guardo el valor de retorno contenido en $v1 de la subrutina en IMP
	    halt                        ; Fin del programa

CANT_IMP: daddi $sp, $sp, -8	    ; Reservo lugar en la pila para hacer un PUSH, 1x8 = 8
	    sd $ra, 0($sp)		        ; Guardo en la pila $ra
	    daddi $t3, $0, 0	        ; Inicializo $t3 en 0 para luego irme desplazando por TABLA usando desplazamientos
LOOP:	beqz $a0, FIN		        ; Salto a FIN si mi tabla llego a su fin
	    jal ES_IMP		            ; Salto a ES_IMP para verificar si el numero actual es impar. Multiples subrutinas
 	    dadd $v1, $v1, $v0          ; Voy a ir acumulando en $v1, la cantidad de numeros impares de TABLA. Notar que sumo la cantidad actual de $v1 con el resultado de la subrutina ES_IMP (contenido en $v0)	
	    daddi $t3, $t3, 8 	        ; Avanzo al siguiente numero
	    ld $a0, TABLA($t3)	        ; Hago el desplazamiento, y ahora si apunto al siguiente elemento de TABLA
	    j LOOP			            ; Sigo loopeando hasta terminar con mi TABLA de numeros
FIN:	ld $ra, 0($sp)		        ; Recupero los datos salvados en la pila, haciendo un POP.  En esta linea recupero el $ra para poder volver al programa principal
	    jr $ra

ES_IMP: ld $t4, MASK($0)	        ; $t4 = MASK. Esta mascara ayudara a saber si el numero es impar
	    and $t4, $a0, $t4	        ; Guardo en $t4, el resultado entre $a0 AND $t4. Recordar que si aplicamos un AND con la mascara XXXXXX1 a cualquier numero, y este retorna 1, significa que el numero es impar
	    beqz $t4, PAR		        ; Si $t4 = 0 significa que el numero es par
	    daddi $v0, $0, 1	        ; El numero es impar, por ende sumo una unidad a $v0
	    j LISTO			            ; No tengo que evaluar nada mas, salto a LISTO
PAR:	daddi $v0, $0, 0            ; El numero es par, dejo $v0 en 0
LISTO:	jr $ra			            ; Vuelvo a la subrutina LOOP

	