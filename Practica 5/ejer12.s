        .data
VALOR:	.word 10
RES:	.word 0

	    .code
	    daddi $sp, $0, 0x400	    ; Inicializo el SP para usar la pila
	    ld $a0, VALOR($0)	        ; $a0 = OFFSET VALOR (direccion de comienzo de RES)
	    jal FACT                    ; Salto a la subrutina FACT y guardo en $ra la direccion de retorno de la subrutina
	    sd $v0, RES($0)		        ; Guardo el valor de retorno contenido en $v0 de la subrutina en RES
	    halt			            ; Fin del programa

FACT:	daddi $sp, $sp, -16	        ; Reservo lugar en la pila para hacer un PUSH, 2x8 = 16
	    sd $ra, 0($sp)		        ; Guardo en la pila $ra
	    sd $s0, 8($sp)		        ; Guardo en la pila $s0
	    beqz $a0 , FIN_1	        ; Salto a FIN_1 si mi recursion para factorial llego a su fin
	    dadd $s0, $0, $a0	        ; Guardo en $s0 el numero actual de valor
	    daddi $a0, $a0, -1	        ; Resto en 1 $a0 para poder hacer el factorial
	    jal FACT		            ; Salto a FACT para hacer recursion
	    dmul $v0, $v0, $s0	        ; Voy a ir poco a poco multiplicando $s0 con $s0, y va a funcionar gracias a la recursion
	    j FIN			            ; Salto a FIN para recuperar todo
FIN_1:	daddi $v0, $0, 1	        ; En el caso de que llegue a $a0 = 0, debo sumar en 1 $v0, asi me omito el caso de multiplicar por 0 y no afectar al resultado
FIN:	ld $s0, 8($sp)		        ; Recupero los datos salvados en la pila, haciendo un POP. En esta linea recupero el valor de $s0 para no perder ningun valor y asi no alterar el resultado
	    ld $ra, 0($sp)		        ; Recupero el valor de $ra para poder ir haciendo la recursion
	    daddi $sp, $sp, 16	        ; Dejo el SP apuntando a la direccion de comienzo de la pila
	    jr $ra			            ; En los primeros casos sirve para la recursion, pero en la ultima iteracion, volvera al programa principal