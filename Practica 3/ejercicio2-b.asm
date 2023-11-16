PA EQU 30H
PB EQU 31H
CA EQU 32H
CB EQU 33H

ORG 1000H
STR DB "ORGANIZACION Y ARQUITECTURA DE COMPUTADORAS"
FIN DB ?

ORG 2000H
;CONFIGURACION DE PA 
MOV AL,1
OUT CA,AL
;CONFIGURACION DE PB 
MOV AL, 0
OUT CB, AL
;CARGO EN CL LA LONGITUD DEL STRING Y INICIALIZO BX
MOV CL, OFFSET FIN - OFFSET STR
MOV BX, OFFSET STR
;MAIN LOOP
LOOP:
;CONSULTA DE ESTADO
IN AL,PA
AND AL,1
JNZ LOOP
;IMPRIMO CARACTER
MOV AL,[BX]
OUT PB,AL
CALL SEND_STROBE
;AUMENTO BX REDUZCO CL
INC BX
DEC CL
JNZ LOOP
A:JMP A
HLT

ORG 3000H
SEND_STROBE:
PUSH AX
IN AL,PA
AND AL,11111101B
OUT PA,AL
OR AL,00000010B
OUT PA,AL
POP AX
RET
END
