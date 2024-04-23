section .data
	st db "Sahil Khan",0
	len equ $-st

section .bss
	copy resb len

section .text
	global main
	extern puts

main:	
	mov esi,st
	mov edi,copy
	mov ecx,len
	rep movsb
	jmp end

lp:	mov al,byte[edi]
	mov byte[esi],al
	inc esi
	inc edi
	dec ebx
	cmp ebx,0
	jl end
	jmp lp
	
end: 	push copy
	call puts
	add esp,4
	ret
;;loop(auto dec ecx)
;;esi(source)
;;edi(destination)
;;movb(moves a byte from esi to edi)
;;rep(only to be used with strings)
