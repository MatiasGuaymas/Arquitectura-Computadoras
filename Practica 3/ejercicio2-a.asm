PA EQU 30H
PB EQU 31H
CA EQU 32H
CB EQU 33H

ORG 1000H
CHAR DB "A"

ORG 2000H
;CONFIGURACION DE PA 
MOV AL,1
OUT CA,AL
;CONFIGURACION DE PB 
MOV AL, 0
OUT CB, AL
;CARGO EL CARACTER EN PB
MOV AL,CHAR
OUT PB,AL
;STROBE
CALL SEND_STROBE
HLT

ORG 3000H
SEND_STROBE: PUSH AX
IN AL,PA
AND AL,11111101B
OUT PA,AL
OR AL,00000010B
OUT PA,AL
POP AX
RET
END