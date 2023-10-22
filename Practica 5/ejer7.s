	    .data
TABLA:	.word  1, 7, 8, 2, 5, 10, 13, 3, 9, 11
M:	    .word  7
LONG:	.word  10
CANT:	.word  0

		.code
		ld $a0, M($0) 		        ; $a0 = 7
		ld $a1, LONG($0)	        ; $a1 = 10 (cantidad de elementos de TABLA)
		daddi $a2, $0, TABLA	    ; $a2 = OFFSET TABLA (direccion de comienzo de TABLA)
		jal EMPEZAR		            ; Salto a la subrutina EMPEZAR y guardo en $ra, la direccion de retorno
		sd $v0, CANT($0)	        ; Guardo el valor de retorno contenido en $v0 de la subrutina en RESULTADO
        halt			            ; Termino el programa
        
EMPEZAR: dadd $t0, $a1, $0	        ; Guardo en el registro temporal $t0 la cantidad de elementos
		dadd $v0, $0, $0	        ; Inicializo $v0 en 0
BUSCA:  ld $t1, 0($a2)		        ; Cargo en $t1 la direccion de comienzo de TABLA, es decir el primer elemento de la misma
		slt $t2, $t1, $a0	        ; $t2 = 1 si $t1 < $a0, es decir que el elemento actual de la tabla es mas chico que M
		bnez $t2, NO_INC	        ; Si t2 <> 0 entonces salto a NO_INC
		beq $t1, $a0, NO_INC	    ; Si el elemento actual de la tabla es igual a M, salto a NO_INC
		daddi $v0, $v0, 1	        ; El elemento actual es mayor, por ende tengo que sumar en 1 $v0. Aumento el contador
NO_INC: daddi $a2, $a2, 8	        ; Paso al siguiente elemento de TABLA
		daddi $t0, $t0, -1	        ; Decremento la cantidad de elementos de TABLA
		bnez $t0, BUSCA		        ; Si todavia no termine de analizar TABLA, vuelvo a loopear, salto a EMPEZAR
		jr $ra			            ; Vuelvo al programa principal