EOI EQU 20h
IMR EQU 21h
INT0 EQU 24h
N_F10 EQU 10

org 40
IP_F10 DW RUT_F10

org 1000h
LETRA DB ?

org 3000h
RUT_F10: push ax
push bx
inc cl
mov LETRA, ah
mov bx, offset LETRA
mov al, 1
int 7
mov al, EOI
out EOI, al
pop bx
pop ax
iret

org 4000h
ABCDE: mov ah, 65
LAZO: cmp cl, 1
jz FIN
inc ah
cmp ah, 90
jnz LAZO
jmp ABCDE
FIN: ret

org 2000h
cli
mov al, 0FEh
out IMR, al
mov al, N_F10
out INT0, al
mov cl, 0
sti
call ABCDE
int 0
end