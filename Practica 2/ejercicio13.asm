CONT EQU 10h
COMP EQU 11h
EOI EQU 20h
IMR EQU 21h
INT1 EQU 25h
N_CLK EQU 10

org 40
IP_CLK DW RUT_CLK
org 1000h
MIN_D DB 30h
MIN_U DB 30h, 58
SEG_D DB 30h
SEG_U DB 30h, 32
FIN DB ?

org 3000h
RUT_CLK: push ax
inc SEG_D
cmp SEG_D, 36h
jnz IMPRIMIR
mov SEG_D, 30h
inc MIN_U
cmp MIN_U, 3Ah
jnz IMPRIMIR
mov MIN_U, 30h
inc MIN_D
cmp MIN_D, 36h
jnz IMPRIMIR
mov MIN_D, 30h
IMPRIMIR: int 7
mov al, 0
out CONT, al
mov al, EOI
out EOI, al
pop ax
iret

org 2000h
cli
mov al, 0FDh
out IMR, al
mov al, N_CLK
out INT1, al
mov al, 0
out CONT, al
mov al, 10
out COMP, al
mov bx, offset MIN_D
mov al, offset FIN - offset MIN_D
sti
LAZO: jmp LAZO
int 0
end