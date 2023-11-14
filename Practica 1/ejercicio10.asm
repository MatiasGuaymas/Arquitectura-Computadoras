org 1000h
NUM1 DW 1234h
NUM2 DW 5678h
org 3000h
SWAP: push ax
push bx
push cx
push dx
mov bx, sp
add bx, 10
mov bx, [bx]
mov cx, [bx]
mov bx, sp
add bx, 12
mov bx, [bx]
mov dx, [bx]
mov bx, sp
add bx, 10
mov bx, [bx]
mov [bx], dx
mov bx, sp
add bx, 12
mov bx, [bx]
mov [bx], cx
pop dx
pop cx
pop bx
pop ax
ret
org 2000h
mov ax, offset NUM1
mov cx, offset NUM2
push ax
push cx
call SWAP
pop cx
pop ax
hlt
end