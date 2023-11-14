org 1000h
NUM1 DB 10
NUM2 DB 5

org 3000h
RESTO: mov cl, 0
mov ch, 0
cmp ah, 0
jz FIN
cmp al, 0
jz FIN
DIV: sub al, ah
js RES
inc cl
jmp DIV
RES: add al, ah
mov ch, al
FIN: ret

org 2000h
mov al, NUM1
mov ah, NUM2
call RESTO
hlt
end