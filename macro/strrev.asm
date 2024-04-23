%macro rev 3
	mov esi,%1
	mov edi,%2
	mov ebx,%3
	add edi,ebx
	mov byte[edi],0
re:	cmp byte[esi],0
	je end
	mov al,byte[esi]
	mov byte[edi],al
	inc esi
	dec edi
	jmp re
end:
%endmacro 

section .data
	inp db "%s",0

section .bss
	stro resb 100
	strrev resb 100
	l resd 1

section .text
	global main
	extern scanf,printf

main:
	push stro
	push inp
	call scanf
	add esp,8
	xor ebx,ebx
	mov esi,stro

len:	cmp byte[esi],0
	je fun
	inc ebx
	inc esi
	jmp len

fun:	mov dword[l],ebx
	rev stro,strrev,ebx
	pusha
	mov eax,4
	mov ebx,1
	mov ecx,strrev
	mov edx,l
	int 80h
	popa
	ret
