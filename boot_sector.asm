[org 0x7c00]

mov bx,startup_str
call print_str

jmp $

print_str:
	pusha
	mov ah,0x0e
print_loop:
	mov al,[bx]
	cmp al,0
	je print_str_done
	int 0x10
	add bx,1
	jmp print_loop
print_str_done:
	popa
	ret


startup_str db "Canopy OS (Version 0.0.1)",0

times 510 -($-$$) db 0
dw 0xaa55