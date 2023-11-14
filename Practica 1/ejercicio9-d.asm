org 1000h
CADENA DB 10010100b
N DB 2

org 3000h
DIV: cmp al, 0
jz FIN1
cmp al, 2
jc FIN1
sub al, 2
jc FIN1
inc cl
jmp DIV
FIN1: ret

org 4000h
ROTARDER: mov cl, 0
call DIV
cmp al, 1
jnz FIN2
add cl, 80h
FIN2: ret

org 5000h
ROTARDER_N: cmp ah, 0
jz FIN3
call ROTARDER
dec ah
mov al, cl
jmp ROTARDER_N
FIN3: mov CADENA, cl
ret

org 2000h
mov al, CADENA
mov ah, N
call ROTARDER_N
hlt
end