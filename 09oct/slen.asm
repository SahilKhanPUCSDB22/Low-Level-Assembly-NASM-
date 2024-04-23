section .data
	msg db "deepak",0
	pr db "%d",0

section .text
	global main
	extern printf,strlen

main:
	pusha
	mov esi,msg
	push esi
	call strlen	
	add esp,4
	push eax
	push pr
	call printf
	popa
	add esp,8
	ret
