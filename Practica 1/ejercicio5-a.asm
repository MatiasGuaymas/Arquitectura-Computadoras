org 1000h
A DW 1h
B DW 2h
C DW 3h
D DW ?
org 2000h
mov ax, A
add ax, B
sub ax, C
mov D, ax
hlt
end