                .data 
CONTROL:        .word32 0x10000
DATA:           .word32 0x10008
CONTRA:         .asciiz 'MATU'
MSJ_ERROR:      .asciiz 'ERROR, ARRANCA DE NUEVO'
MSJ_BIENV:      .asciiz 'Bienvenido'

                .text
                lwu $s0, CONTROL($0)        ; $s0 = DIR.CONTROL
                lwu $s1, DATA($0)           ; $s1 = DIR.DATA
                daddi $sp, $0, 0x400        ; Inicializo la pila
                jal CHAR
                halt

CHAR:           daddi $sp, $sp, -8          ; Push
                sd $ra, 0($sp)              ; Guardo la direccion de retorno en la pila
                daddi $t1, $0, 9            ; $t1 = constante para ir leyendo
                daddi $t0, $0, 0            ; $t0 = puntero para ir recorriendo la clave y contraseña
                daddi $t5, $0, 4            ; $t5 = cantidad de caracteres de CLAVE 
LOOP:           dadd $t3, $0, $t1           ; $t3 = caracter leido
                sd $t3, 0 ($s0)             ; Envio un 9 a CONTROL para leer un caracter
                lbu $t3, 0 ($s1)            ; Cargo el caracter
                beqz $t5, FIN               ; Si ya termine de contar mi cantidad de caracteres salto a FIN
                lbu $t0, CONTRA($a0)        ; Puntero
                beq $t3, $t0, SON_IGUALES   ; Si t3 = t0 significa que son el mismo caracter y debo seguir
                daddi $t4, $zero, MSJ_ERROR ; Si t3 <> t0 significa que son distintos caracter, por ende cargo el mensaje de error en $t4    
                sd $t4, 0($s1)              ; Guardo en DATA el string ERROR
                JAL RESPUESTA               ; Salto a la subrutina de respuesta
                daddi $t5, $0, 4            ; Reinicio la cantidad de caracteres a leer
                daddi $a0, $0, 0            ; Reinicio el puntero $a0
                j LOOP                      ; Segui intentando :)

SON_IGUALES:    daddi $t5, $t5, -1          ; Resto en uno a la cantidad de caracteres que tengo que leer 
                daddi $a0, $a0, 1           ; Me desplazo un bit
                beqz $t5, FIN               ; Si no tengo mas caracteres para leer salto a FIN
                j LOOP                      ; Sigo loopeando
        
FIN:            daddi $t4, $zero, MSJ_BIENV ; Si llegue aca significa que la contraseña que inserte es la correcta
                sd $t4, 0($s1)              ; Guardo en DATA el string Bienvenido
                JAL RESPUESTA               ; Salto a la suburutina RESPUESTA
                ld $ra, 0($sp)              ; Desapilo la direccion de retorno
                daddi $sp, $sp, 8           ; Dejo la pila limpia
                jr $ra                      ; Vuelvo al programa principal
RESPUESTA:      daddi $t7, $zero, 4         ; Escribo en $t7 el ID 4 para imprimir un String
                sd $t7, 0($s0)              ; Imprimo el string
                jr $ra                      ; Vuelvo a la subrutina FIN