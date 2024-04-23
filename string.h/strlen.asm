section .data
	msg db "Sahil Khan",0
	pr db "Length=%d",0

section .text
	global main
	extern printf

main:	mov ecx,0
	mov ebx,msg
lp1:	mov al,byte[ebx]
	cmp al,0
	je end
	add ecx,1
	inc ebx
	jmp lp1
	
end:	push ecx
	push pr 
	call printf
	add esp,8
	ret	
