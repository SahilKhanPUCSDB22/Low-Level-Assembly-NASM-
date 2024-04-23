section .data
	s1 db "Source String",0
	len equ $-s1

section .bss
	s2 resb len

section .text
	global main
	
main: 
	mov esi,s1
	mov edi,s2
	mov ecx,len
l1:	xor eax,eax
	lodsb
	stosb
	loop l1

	mov eax,4
	mov ebx,1
	mov ecx,s2
	mov edx,len
	int 80h
	ret

