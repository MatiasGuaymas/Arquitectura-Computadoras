org 1000h
ORIGINAL DB “A”
REEMPLAZO DB “E”
CADENA DB “AbCdE”
DB 0

org 3000h
REEMPLAZAR_CAR: push ax
push bx
mov bx, sp
add bx, 8
mov ax, [bx]
mov bx, sp
add bx, 6
mov bx, [bx]
LAZO: cmp byte ptr [bx], 0
jz FIN
cmp byte ptr [bx], al
jnz NO_ES_IGUAL
mov [bx], ah
NO_ES_IGUAL: inc bx
jmp LAZO
FIN: pop bx
pop ax
ret

org 2000h
mov al, ORIGINAL
mov ah, REEMPLAZO
mov cx, offset CADENA
push ax
push cx
call REEMPLAZAR_CAR
pop cx
pop ax
hlt
end