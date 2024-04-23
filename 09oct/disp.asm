section .data
	msg db "%c",0

section .text 
	global main
	extern atoi,printf

main:
	enter 0,0
	mov eax,dword[esp+12]
	push eax
	;call atoi
	;add ebp,4
	;push eax
	push msg
	call printf
	add ebp,8
	leave
	ret
	
