		.data
tabla: 	.word  20,1,5,3,2,58,18,7,12,11,0
result: .word 0
		
		.code
		daddi  $a0, $0, tabla       ; $a0 = OFFSET TABLA (direccion de comienzo de TABLA)
		jal impar                   ; Salto a la subrutina impar y guardo en $ra la direccion de retorno de la suburutina
		sd $v0, result($0)          ; Guardo el valor de retorno contenido en $v0 de la subrutina en result
		halt

impar:	dadd $v0, $0, $0            ; Inicializo $v0 en 0
sigo:	lbu $a1, 0($a0)             ; Cargo en $a1 el primer numero de la tabla
		beqz $a1, final             ; Salto a final si mi tabla llego a su fin
		andi  $a1, $a1, 0x00000001  ; Si $a1 = 1 , significa que el numero es impar. Recordar que si aplicamos un AND con la mascara XXXXXX1 a cualquier numero, y este retorna 1, significa que el numero es impar
		beqz $a1, par               ; Si $a1 = 0, significa que el numero es par, si es asi salto a par
		daddi $v0, $v0, 1           ; Si el numero es impar, $v0 += 1
par: 	daddi $a0, $a0, 8           ; Avanzo al siguiente numero de la tabla
		j sigo 	                    ; Sigo loopeando hasta que se termine mi tabla de numeros
final:	jr $ra                      ; Vuelvo al programa principal