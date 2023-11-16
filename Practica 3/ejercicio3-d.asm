DATO EQU 40h
ESTADO EQU 41h

org 1000h
CHARS DB 5
CADENA DB ?,?,?,?,?
FIN DB ?

org 2000h
mov bx, offset CADENA
mov cl, CHARS
LAZO: int 6
inc bx
dec cl
cmp cl, 0
jnz LAZO
mov bx, offset CADENA
mov cl, offset FIN - offset CADENA
POLL1: in al, ESTADO
and al, 1
jnz POLL1
mov al, [bx]
out DATO, al
inc bx
dec cl
jnz POLL1
mov bx, offset CADENA+4
mov cl, offset FIN - offset CADENA
POLL2: in al, ESTADO
and al, 1
jnz POLL2
mov al, [bx]
out DATO, al
dec bx
dec cl
jnz POLL2
int 0
end