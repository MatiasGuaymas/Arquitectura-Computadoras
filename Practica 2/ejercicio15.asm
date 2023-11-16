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
NUM DB ?, 32
FIN_NUM DB ?

org 3000h
RUT_CLK: push ax
int 7
dec cl
cmp cl, 30h
jns SEGUIR
mov al, 0FFh
out IMR, al
jmp FIN
SEGUIR: mov NUM, cl
mov al, 0
out CONT, al
FIN: mov al, EOI
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
mov al, 0FEh
out IMR, al
mov al, N_F10
out INT0, al
mov al, N_CLK
out INT1, al
mov al, 0
out CONT, al
mov al, 10
out COMP, al
mov bx, offset NUM
int 6
mov bx, offset NUM
mov al, offset FIN_NUM - offset NUM
mov cl, NUM
sti
LAZO: cmp cl, 30h
jns LAZO
int 0
end