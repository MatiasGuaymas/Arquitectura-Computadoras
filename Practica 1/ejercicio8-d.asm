org 1000h
VOCALES DB 65,69,73,79,85,97,101,105,111,117
CADENA DB “AbCdE”
DB 0
RES DB ?

org 3000h
ES_VOCAL: push bx
mov ah, 00h
mov cl, offset CADENA - offset VOCALES
mov bx, offset VOCALES
LAZO1: cmp al, [bx]
jz VOCAL
inc bx
dec cl
jz FIN1
jmp LAZO1
VOCAL: mov ah, 0FFh
FIN1: pop bx
ret

org 4000h
CONTAR_VOC: mov dl, 0
LAZO2: mov al, [bx]
cmp al, 0
jz FIN2
call ES_VOCAL
cmp ah, 0FFh
jnz NO_ES_VOCAL
inc dl
NO_ES_VOCAL: inc bx
jmp LAZO2
FIN2: ret

org 2000h
mov bx, OFFSET CADENA
call CONTAR_VOC
mov RES, dl
hlt
end