section .data
	inp db "%d",0
	ou db "%f",10,0

section .bss
	nx resd 1
	i resd 1
	res resq 1
	tmpres resq 1

section .text
	global main
	extern printf,scanf

main:
	push nx
	push inp
	call scanf
	add esp,8

	mov dword[i],1
	fild dword[nx]
	mov ebx,dword[nx]

lp1:	cmp dword[i],ebx
	jg end
	fild dword[i]
	fdiv st0,st1
	fld qword[res]
	fadd st0,st1
	fstp qword[res]
	fstp qword[tmpres]
	inc dword[i]
	jmp lp1
	
end:
	sub esp,8
	fld qword[res]
	fst qword[esp]
	push ou
	call printf
	add esp,12
	ret
	
	
	
	
