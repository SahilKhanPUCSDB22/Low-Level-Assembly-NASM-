section .data
	msg db "abcd",10,0
	len equ $-msg
	;pr db "%s",10,0

section .bss
	rev resb (len-2)

section .text 
	global main
	extern printf

main:
	mov esi,msg
	mov ebx,3
	mov edx,len
lp1:	sub edx,ebx
	add esi,edx
	mov al,byte[esi]
	mov edi,rev
	mov byte[edi],al
	inc ebx
	inc edi
	cmp edx,len
	jg end
	jmp lp1

end:	mov eax ,4
	mov ebx,1
	mov ecx,rev
	mov edx,(len-2)
	int 0x80 
	add esp,0
	ret
