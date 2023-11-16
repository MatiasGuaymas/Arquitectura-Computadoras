PA EQU 30h
PB EQU 31h
CA EQU 32h
CB EQU 33h

org 2000h
mov al, 0FFh
out CA, al
mov al, 0
out CB, al
POLL: in al, PA
out PB, al
jmp POLL
int 0
end