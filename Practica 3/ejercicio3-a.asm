DATO EQU 40h
ESTADO EQU 41h

org 1000h
MSJ DB “INGENIERÍA E INFORMÁTICA”
FIN DB ?

org 2000h
mov bx, offset MSJ
mov cl, offset FIN - offset MSJ
POLL: in al, ESTADO
and al, 1
jnz POLL
mov al, [bx]
out DATO, al
inc bx
dec cl
jnz POLL
int 0
end