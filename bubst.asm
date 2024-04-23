section .data
	msg db "val1:%d and val2:%d",10,0
	p db "val=%d",10,0
	arr dd 10,23,12,6,34,45

section .bss
	brr resd 6

section .text
	global main
	extern printf

main:
	mov ebx,dword[brr+20]
	mov ecx,arr
	mov edx,20
	
lp1:	xchg ebx,dword[ecx]
	cmp edx,0
	jz end
	sub ebx,4
	add ecx,4
	sub edx,4
	jmp lp1

end:	
	mov eax,brr
	push dword[eax]
	push p
	call printf
	add esp,8	
	ret
