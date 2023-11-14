org 1000h
CADENA DB “AbCdE”
DB 0
CHAR DB “A”
RES DB ?

org 3000h
CONTAR_CAR: mov ah, 0
LAZO: cmp byte ptr [bx], 0
jz FIN
cmp al, [bx]
jnz NO_ES_IGUAL
inc ah
NO_ES_IGUAL: inc bx
jmp LAZO
FIN: ret

org 2000h
mov al, CHAR
mov bx, offset CADENA
call CONTAR_CAR
mov RES, ah
hlt
end