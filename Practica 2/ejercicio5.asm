org 1000h
MSJ1 DB "INGRESAR UN NÚMERO (de un dígito): "
FIN1 DB ?
MSJ2 DB "CARACTER NO VÁLIDO "
FIN2 DB ?
NUM DB ?

org 3000h
ES_NUM: mov ah, 0FFh
cmp byte ptr [bx], 30h
js ERROR
cmp byte ptr [bx], 3Ah
jns ERROR
jmp FIN
ERROR: mov ah, 00h
mov bx, offset MSJ2
mov al, offset FIN2 - offset MSJ2
int 7
FIN: ret

org 2000h
mov bx, offset MSJ1
mov al, offset FIN1 - offset MSJ1
int 7
mov bx, offset NUM
int 6
call ES_NUM
mov al, 1
int 7
int 0
end