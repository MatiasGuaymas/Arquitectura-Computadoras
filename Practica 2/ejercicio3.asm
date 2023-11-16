org 1000h
MAY DB 41h
MIN DB 61h

org 2000h
mov bx, offset MAY
mov al, 2
LAZO: int 7
inc MAY
inc MIN
cmp MAY, 5Bh
jnz LAZO
int 0
end