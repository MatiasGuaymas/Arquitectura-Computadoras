PB EQU 31h
CB EQU 33h

org 1000h
PATRON DB 0,1,2,4,8,16,32,64,128

org 2000h
mov bx, offset PATRON
mov al, 0
out CB, al
CRECER: inc bx
mov al, [bx]
out PB, al
cmp byte ptr [bx], 128
jnz CRECER
DECRECER: dec bx
mov al, [bx]
out PB, al
cmp byte ptr [bx], 1
jnz DECRECER
jmp CRECER
int 0
end