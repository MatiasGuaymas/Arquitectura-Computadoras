	    .data
CAD1:	.asciiz	"uwu2"
CAD2:	.asciiz	"uwu"
RES:	.word 0
	
	    .code
	    daddi $a0, $0, CAD1 	; $a0 = OFFSET CAD1 (direccion de comienzo de la cadena CAD1)
	    daddi $a1, $0, CAD2 	; $a1 = OFFSET CAD1 (direccion de comienzo de la cadena CAD2)
	    jal COMP		        ; Salto a la subrutina COMP y guardo en $ra la direccion de retorno de la subrutina
	    sd $v0, RES($0)		    ; Guardo el valor de retorno contenido en $v0 de la subrutina en RES
	    halt			        ; Fin del programa
	
COMP:	dadd $v0, $0, $0	    ; Inicializo $v0 en 0
LOOP:	lbu $t0, 0($a0)		    ; Cargo en $t0 la direccion de comienzo de la cadena CAD1
	    lbu $t1, 0($a1)		    ; Cargo en $t1 la direccion de comienzo de la cadena CAD2
	    beqz $t0, FIN_1		    ; Si llego al final de la cadena CAD1, salto a FIN1
	    beqz $t1, FINAL		    ; Si llego a ejecutar esta instruccion significa que CAD1 aun no termino, pero si lo hizo CAD2, por ende en esta posicion las cadenas son distintas. Salto a FINAL
	    bne $t0, $t1, FINAL	    ; Salto a FINAL si el caracter en $t0 es distinto de $t1
	    daddi $v0, $v0, 1	    ; Hasta la posicion $v0 (contemplar la posicion 0) son iguales, es decir que en $v0+1 difieren las cadenas
	    daddi $a0, $a0, 1	    ; Paso al siguiente elemento de CAD1
	    daddi $a1, $a1, 1	    ; Paso al siguiente elemento de CAD2
	    j LOOP			        ; Sigo loopeando
FIN_1:	bnez $t1, FINAL		    ; Salto a FINAL si $t1 es distinto de $t0, analizamos previamente que CAD1 termino, y para que sean iguales deben terminar en el mismo punto
	    daddi $v0, $0, -1	    ; En caso de que las dos cadenas sean identicas, retorno -1: fffffffff...
FINAL:	jr $ra			        ; Vuelvo al programa principal