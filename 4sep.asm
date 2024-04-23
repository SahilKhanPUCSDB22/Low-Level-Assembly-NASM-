section .data
	Array dd 110,201,310,401,250,-1
	msg db "Addition is %d",10,0
section .bss
	four resd 1

section .text
	global main
	extern printf

main: 
	xor esi ,esi
	mov dword[four],4
	xor ecx,ecx

lp:     mov edi,Array
	mov eax,dword[four]
	mul ecx
	add edi,eax
	cmp dword[edi],-1
	jz lp1
	add esi,dword[edi]
	inc ecx
	jmp lp

lp1:	push esi
	push msg
	call printf
	add esp,8
	ret
	
