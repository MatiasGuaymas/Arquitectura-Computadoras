EOI EQU 20h
IMR EQU 21h
INT2 EQU 26h
DATO EQU 40h
ESTADO EQU 41h
N_HSK EQU 10

org 40
IP_HSK DW RUT_HSK

org 1000h
MSJ DB "UNIVERSIDAD NACIONAL DE LA PLATA"
FIN_MSJ DB ?

org 3000h
RUT_HSK: push ax
mov al, [bx]
out DATO, al
inc bx
dec cl
cmp cl, 0
jnz FIN
mov al, 0FFh
out IMR, al
in al, ESTADO
and al, 0111111b
out ESTADO, al
FIN: mov al, EOI
out EOI, al
pop ax
iret

org 2000h
cli
mov al, 0FBh
out IMR, al
mov al, N_HSK
out INT2, al
in al, ESTADO
or al, 10000000b
out ESTADO, al
mov bx, offset MSJ
mov cl, offset FIN_MSJ - offset MSJ
sti
LAZO: cmp cl, 0
jnz LAZO
int 0
end