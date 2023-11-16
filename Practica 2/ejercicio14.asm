CONT EQU 10h
COMP EQU 11h
EOI EQU 20h
IMR EQU 21h
INT0 EQU 24h
INT1 EQU 25h
N_CLK EQU 10
N_F10 EQU 20

org 40
IP_CLK DW RUT_CLK

org 80
IP_F10 DW RUT_F10

org 1000h
SEG_D DB 30h
SEG_U DB 30h, 32
FIN DB ?

org 3000h
RUT_CLK: push ax
inc SEG_U
cmp SEG_U, 3Ah
jnz IMPRIMIR
mov SEG_U, 30h
inc SEG_D
cmp SEG_D, 33h
jnz IMPRIMIR
mov cl, 1
mov al, 0FFh
out IMR, al
IMPRIMIR: int 7
mov al, 0
out CONT, al
mov al, EOI
out EOI, al
pop ax
iret

org 4000h
RUT_F10: push ax
in al, IMR
xor al, 00000010b
out IMR, al
mov al, EOI
out EOI, al
pop ax
iret

org 2000h
cli
mov al, 0FCh
out IMR, al
mov al, N_F10
out INT0, al
mov al, N_CLK
out INT1, al
mov al, 0
out CONT, al
mov al, 10
out COMP, al
mov bx, offset SEG_D
mov al, offset FIN - offset SEG_D
mov cl, 0
sti
LAZO: cmp cl, 0
jz LAZO
int 0
end