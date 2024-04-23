section .data
	s1 db "Sahil",0
	len equ $-s1
	s2 db "Khan",0
	len2 equ $-s2
	pr db "%d",0
	len1 equ $-s1

section .bss
	cat resb len+len2

section .text
	global main
	extern printf

main:
	push len
	push pr
	call printf
	add esp,8
	ret
	mov ebx,cat
	mov ecx,s1
	mov edx,1
	
lp1:	mov al,byte[ecx]
	mov byte[ebx],al
	cmp edx,len1
	je end
	inc edx
	inc ecx
	inc ebx
	jmp lp1

lp2:	inc ebx
	mov ecx,s2
	mov edx,1
	jmp lp3
    	
lp3:	mov al,byte[ecx]
	mov byte[ebx],al
	cmp edx,len2
	je end
	inc edx
	inc ecx
	inc ebx
	jmp lp3

end:	mov esi,len1
	add esi,len2
	pusha
	mov eax,4
	mov ebx,1
	mov ecx,cat
	mov edx,len
	int 80h
	popa
	ret
