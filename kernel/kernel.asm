[org 0x7c00]
[bits 16]

section .text

    global main

main:
cli
jmp 0x000000:ZeroSeg
ZeroSeg:
    xor ax, ax
    mov ss, ax
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov sp, main
    cld
sti
push ax

xor ax, ax
int 0x13
pop ax


mov si, STR
call print

mov si, S
call print

mov si, S2
call print

call readDisk

mov dx, [0x7c00 + 510]
call printh
call testA20

mov dx, ax
call printh

jmp $

%include "std.asm"

%include "diskmanage.asm"

%include "printh.asm"

%include "testA20.asm"

STR :db "Hello World", 0x0a, 0x0d, 0
S :db "something", 0x0a, 0x0d, 0
S2 : db "sth 2", 0x0a, 0x0d, 0
Disk_Err: db "Error loading disk", 0x0a, 0x0d, 0

times 510-($-$$) db 0

dw 0xaa55

times 512 db 0
