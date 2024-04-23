section .data
	msg db "low level assembly",10,0
	len dd 0
	msg2 db "%d",10,0
	leng equ $-msg
section .text
	global main
	extern printf

main:
	mov  edi,msg
l1:	mov al,byte[edi]
	cmp al,0
	jz end
	inc edi
	inc dword[len]
	jmp l1

end:    push leng
	push msg2
	call printf
	add esp, 8
	ret

