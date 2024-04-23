section .data
	st db "sahil khan",0
	pr db "found",0
	len equ $-st
	
section .text
	global main
	extern puts

main:
	mov ebx,st
lp:	mov al,byte[ebx]
	cmp al,' '
	je end
	inc ebx
	jmp lp

end:	
	push eax
	call puts
	add esp,4
	ret
	
	
