%macro  compa 3
	mov esi,%2
	mov edi,%3

lp1:	cmp byte[esi],0
	je chkedi
	cmp byte[edi],0
	je chkesi
	mov al,byte[esi]
	cmp al,byte[edi]
	jne pne
	inc esi
	inc edi
	jmp lp1

pne:	mov eax,1
	jmp end
pe:	mov eax,0
	jmp end

chkesi: cmp byte[esi],0
	je pe
	jmp pne

chkedi:	cmp byte[edi],0
	je pe
	jmp pne
	
end:	mov %1,eax
%endmacro

section .data
	y db "Equal",10,0
	n db "Not Equal",10,0
	ts db "%s",0
section .bss
	str1 resb 100
	str2 resb 100

section .text
	global main
	extern printf,scanf

main:
	push str1
	push ts
	call scanf
	push str2
	push ts
	call scanf
	add esp,16
	
	compa eax,str1,str2
	
	cmp eax,0
	je pry 
	cmp eax,1
	je prn
pry:	push y
	call printf
	add esp,4
	jmp rend

prn:	push n
	call printf
	add esp,4
	jmp rend

rend: 	ret
	
