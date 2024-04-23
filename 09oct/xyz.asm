section .data
	msg db "no of args %d",0
	msg1 db "argument %d is %s ",0

section .text
	global main
	extern printf

main:
	push ebp
	mov ebp,esp
	
	mov esi,dword[ebp+8]
	
	push esi
	push msg1
	call printf
	add esp,8
	
	mov ecx,0
	mov edx,dword[ebp+12]
	mov eax,[edx]

lp:	pusha
	mov eax,[edx+ecx*4]
	push eax
	push ecx
	push msg
	call printf
	add esp,12
	popa
	inc ecx

	mov esp,ebp  ;leave
	pop ebp
