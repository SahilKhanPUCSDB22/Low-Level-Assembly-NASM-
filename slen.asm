section .data
	msg db "hello",10,0

section .text
	global main
	extern printf,strlen

main:
	xor eax,eax
	push msg
	call strlen
	add esp,4
	call printf
	add esp,4
	ret
