section .data
	str1 db "sahil",10,0
	str2 db "sahil",10,0

section .text
	global main
	extern printf

main:
	mov esi,str1
	mov edi,str2
	repe cmpsb
	cmp byte[esi],0
	jne end
	cmp byte[edi],0
	jne end
	jmp end1

end: 	
	mov esi,str1
	jmp pr

end1:
	mov esi,str2
	jmp pr

pr:	push esi
	call printf
	add esp,4	
	ret
	

