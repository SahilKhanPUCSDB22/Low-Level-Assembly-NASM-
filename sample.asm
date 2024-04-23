section .data
	msg db "This is nasm assembler",10,0
	m1 db "Snehal is smart",10,0

section .text
	global main
	extern puts,printf

main:
	push msg
	call puts
	push m1
	call printf
	add esp,8
	ret
	 
