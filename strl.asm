section .data
	st db "Sahil",0
	pr db "%d",0
	
section .text
	global main
	extern strlen,printf

main:
	mov ecx,st
	push ecx
	popa
	call strlen
	add esp,4
	push eax
	call printf
	add esp,4
	ret
