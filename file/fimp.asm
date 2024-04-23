section .data
	fname db "file1",0
	towrite db "@sahil1334444",0

section .bss
	buff resb 100
	fd resd 1

section .text
	global main

main:
	mov eax,5
	mov ebx,fname
	mov ecx,2
	mov edx,0777
	int 0x80

	mov dword[fd],eax	

	mov eax,3
	mov ebx,dword[fd]
	mov ecx,buff
	mov edx,5
	int 0x80

	mov eax,4
	mov ebx,dword[fd]
	mov ecx,towrite
	mov edx,6
	int 0x80

	mov eax,6
	mov ebx,dword[fd]
	ret
