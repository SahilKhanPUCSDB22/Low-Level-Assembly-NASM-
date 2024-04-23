%macro len 2
	mov ecx,%1
	mov ebx,0
lp1:	cmp byte[ecx],0
	je re
	inc ebx
	inc ecx
	jmp lp1
re:	mov %2,ebx
%endmacro

section .data
	pr db "%d",10,0
	inp db "%s",0
	str1 db "Sahil",0

section .bss
	var1 resb 100

section .text 
	global main
	extern printf,scanf

main:
	push var1
	push inp
	call scanf
	add esp,8
	len var1,eax
	push eax
	push pr
	call printf
	add esp,8
	ret
