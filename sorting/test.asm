section .data
	num1 dd 10
	pr db "%d",10	
	
section .data
	global main,addition
	extern printf

addition:
	push ebp
	mov ebp,esp
	
	mov eax,[ebp+8]
	add eax,10
	
	mov esp,ebp
	pop ebp
	ret

main:
	push dword[num1]
	call addition
	add esp,4
	push eax
	push pr
	call printf
	add esp,8
	ret
