org 1000h
NUM1 DW 1,2
NUM2 DW 3,4
SUMA DW ?,?

org 3000h
SUM32: push ax
push bx
push cx
mov bx, sp
add bx, 12
mov bx, [bx]
mov ax, [bx]
mov bx, sp
add bx, 10
mov bx, [bx]
mov cx, [bx]
add ax, cx
pushf
mov bx, sp
add bx, 10
mov bx, [bx]
mov [bx], ax
mov bx, sp
add bx, 14
mov bx, [bx]
sub bx, 2
mov ax, [bx]
mov bx, sp
add bx, 12
mov bx, [bx]
sub bx, 2
mov cx, [bx]
popf
adc ax, cx
mov bx, sp
add bx, 8
mov bx, [bx]
sub bx, 2
mov [bx], ax
FIN: pop cx
pop bx
pop ax
ret

org 2000h
mov ax, offset NUM1 + 2
mov cx, offset NUM2 + 2
mov dx, offset SUMA + 2
push ax
push cx
push dx
call SUM32
pop dx
pop cx
pop ax
hlt
end