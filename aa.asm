    push word[ es:si ]
    push word[ es:si+2 ]
    call STOREHASH
    add sp, 4

    push HASHBUF
    push 6
    push 0
    call PRINTMESSAGE
    add sp, 6

    push word[ es:si+4 ]
    push word[ es:si+6 ]
    call STOREHASH
    add sp, 4

    push HASHBUF
    push 6
    push 1
    call PRINTMESSAGE
    add sp, 6

STOREHASH:
    push bp
    mov bp, sp
    mov si, 0

.STOREHASHLOOP:
    add si, 1
    cmp si, 5
    jge .STOREHASHEND

    mov ax, 0
    mov al, byte[ bp + si + 3 ]
    push ax

    mov ax, si - 1
    mul 2
    push ax
    
    call STORECHA    ; STORE CHARACTER
    add sp, 4
    jmp .STOREHASHLOOP

.STOREHASHEND:
    pop bp
    ret

STORECHA:
    push bp
    push si
    mov bp, sp

    mov ax, word[ bp + 6 ]
    mov si, 0

.STORECHALOOP:
    cmp si, 1
    je .SECOND
    cmp si, 2
    je .STORECHAEND:
    shr al, 1

.SECOND:
    cmp al, 10
    jge .OVERTEN
.OVERTENRETURN:
    add al, 0x30
    mov bx, word[ bp + 4 ]
    mov si, bx
    mov byte[ HASHBUF + si ]
    jmp .STORECHALOOP

.OVERTEN:
    add al, 0x07
    jmp .OVERTENRETURN

.STORECHAEND:
    pop si
    pop bp
    ret

