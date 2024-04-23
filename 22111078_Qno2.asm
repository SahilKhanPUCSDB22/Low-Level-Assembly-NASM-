;;assuming max array size of 100

%macro check 1
	mov edi,dword[%1]
	cmp edi,3
	jl pr

lp:	cmp edi,0
	jl pr
	cmp edi,0
	je endm
	sub edi,3
	jmp lp

pr:	
	mov dword[chk],1
	jmp endx
endm:
	mov dword[chk],0
	jmp endx
	
endx:
%endmacro

section .data
	inp db "%d",0
	ot db "%d",10,0
	
section .bss
	n resd 1
	chk resd 1
	array resd 100

section .text
	global main
	extern scanf,printf

main:
	push n
	push inp
	call scanf
	add esp,8

	mov edi,array
	mov ebx,1
	pusha
here:	
	cmp ebx,dword[n]
	jg next
	
	push edi
	push inp
	call scanf
	
	add esp,8

	add ecx,4
	
	inc ebx
	jmp here
	
next:
	popa
	mov ebx,1
	mov edi,array

heree:	cmp ebx,dword[n]
	jg end
	check edi
	cmp dword[chk],1
	je prt
up:	add edi,4
	inc ebx
	jmp heree

prt:
	push edi
	push ot
	call printf
	add esp,8
	jmp up

end:
	ret	
