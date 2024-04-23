%macro cat 3
	mov esi,%1
	mov edi,%2
	mov edx,%3
lp1:	mov al,byte[esi]
	mov byte[edx],al
	cmp byte[esi],0
	je lp2
	inc esi
	inc edx
	jmp lp1

lp2:	mov al,byte[edi]
	mov byte[edx],al
	cmp byte[edi],0
	je end
	inc edi
	inc edx
	jmp lp2

end:	mov byte[edx],0
%endmacro

section .data
	pr db "%s",10,0
	msg1 db "Sahil",0
	msg2 db "Khan",0

section .bss
	msg3 resb 100

section .text
	global main
	extern printf

main:
	cat msg1,msg2,msg3
	push msg3
	push pr
	call printf
	add esp,8
	ret

