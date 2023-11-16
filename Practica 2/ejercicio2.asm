org 1000h
CHAR DW 01h

org 2000h
mov al, 1
mov bx, offset CHAR
LAZO: int 7
inc CHAR
cmp CHAR, 256
jnz LAZO
int 0
end