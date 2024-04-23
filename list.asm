section .data
	msg1 db "this is line1",10
	     db "this is line2",10
	     db "this is line3",10,0
	len equ $-msg1

section .text 
	global main

main:	
	mov esi,3
	mov edi,msg1
	mov al,108
	mov ecx,len
lp:	repne scasb
	jmp end
	
end:	dec edi
	pusha
	mov eax,4
	mov ebx,1
	mov ecx,edi
	mov edx,6
	int 80h
	popa
	inc edi
	dec esi
	cmp esi,0
	jnz lp
	ret
