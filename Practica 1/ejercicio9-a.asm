org 1000h
CADENA DB 10010100b

org 3000h
ROTARIZQ: add al, al
adc al, 0
mov CADENA, al
ret

org 2000h
mov al, CADENA
call ROTARIZQ
hlt
en