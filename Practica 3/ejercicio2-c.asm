PA EQU 30h
PB EQU 31h
CA EQU 32h
CB EQU 33h

org 1000h
CHAR DB ?
CHARS DB 5

org 3000h
PIO: push ax
mov al, 1
out CA, al
mov al, 0
out CB, al
pop ax
ret

org 4000h
STROBE0: push ax
in al, PA
and al, 11111101b
out PA, al
pop ax
ret

org 5000h
STROBE1: push ax
in al, PA
or al, 00000010b
out PA, al
pop ax
ret

org 6000h
POLL: push ax
in al, PA
and al, 1
jnz POLL
pop ax
ret

org 2000h
call PIO
call STROBE0
mov bx, offset CHAR
mov cl, CHARS
LAZO: int 6
call POLL
mov al, [bx]
out PB, al
call STROBE1
call STROBE0
dec cl
jnz LAZO
int 0
end