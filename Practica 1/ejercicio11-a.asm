org 1000h
NUM1 DB 10
NUM2 DB 5
RES DB ?

org 3000h
DIV: push ax
push bx
push cx
mov cx, 0
mov bx, sp
add bx, 10
mov ax, [bx]
LAZO: sub al, ah
js FIN
inc cx
jmp LAZO
FIN: mov bx, sp
add bx, 8
mov bx, [bx]
mov [bx], cx
pop cx
pop bx
pop ax
ret

org 2000h
mov al, NUM1
mov ah, NUM2
mov cx, offset RES
push ax
push cx
call DIV
pop cx
pop ax
hlt
end