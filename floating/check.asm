section .data
	msg db "%d",10,0
section .bss
	v1 resd 1
section .text
	global main
	extern printf
main:
	mov dword[v1],10
	inc dword[v1]
	push dword[v1]
	push msg
	call printf
	add esp,8
	ret
