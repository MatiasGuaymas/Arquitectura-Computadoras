org 1000h
CADENA DB “aBcDe”
DB 0
RES DW ?

org 3000h
CONTAR_MIN: mov dx, 0
LAZO: cmp byte ptr [bx], 0
jz FIN
mov al, [bx]
cmp al, 123
jns NO_ES_MIN
cmp al, 97
js NO_ES_MIN
inc dx
NO_ES_MIN: inc bx
jmp LAZO
FIN: ret

org 2000h
mov bx, offset CADENA
call CONTAR_MIN
mov RES, dx
hlt
end