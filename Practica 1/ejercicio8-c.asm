org 1000h
VOCALES DB 65,69,73,79,85,97,101,105,111,117
CHAR DB “A”
RES DB ?

org 3000h
ES_VOCAL: mov ah, 00h
mov cl, offset CHAR - offset VOCALES
mov bx, offset VOCALES
LAZO: cmp al, [bx]
jz VOCAL
inc bx
dec cl
jz FIN
jmp LAZO
VOCAL: mov ah, 0FFh
FIN: ret

org 2000h
mov al, CHAR
call ES_VOCAL
mov RES, ah
hlt
end
