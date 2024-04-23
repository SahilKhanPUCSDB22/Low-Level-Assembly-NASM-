section .data
	msg db "sum is = %d",0

section .text
	global main	
	extern printf,atoi

main:
	push ebp
	mov ebp,esp

	pusha
	add ebp,12
	mov esi,dword[ebp]
	push esi
	call atoi
	add ebp,4
	mov ebx,eax

	add ebp,4
	mov esi,dword[ebp]
	push esi
	call atoi
	add ebp,4
	add ebx,eax

	push ebx
	add ebp,4
	push msg
	add ebp,4
	call printf
	mov esp,ebp
	pop ebp
	popa
	ret
	
