%macro cy 2
	mov esi,%1
	mov edi,%2
	
lp:	cmp byte[esi],0
	je end
	mov al,byte[esi]
	mov byte[edi],al
	inc esi
	inc edi
	jmp lp
end:
	mov byte[edi],0
%endmacro

section .data
	msgsp db "%s",0

section .bss
	msg1 resb 100
	msg2 resb 100

section .text
	global main
	extern scanf,printf

main:
	push msg1
	push msgsp
	call scanf
	add esp,8	
	cy msg1,msg2
	push msg2
	push msgsp
	call printf
	add esp,8
	ret
