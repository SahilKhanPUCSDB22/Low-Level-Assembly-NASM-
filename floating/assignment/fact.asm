%macro fact 1
	mov eax,%1
	mov ecx,eax
	dec ecx
lp:	cmp ecx,1
	jl endm
	mul ecx
	dec ecx
	jmp lp
endm:	
	mov dword[fres],eax
%endmacro

section .data
	inp db "%d",0
	ou db "%f",10,0

section .bss
	n resd 1
	i resd 1
	fres resd 1
	res resq 1
	dump resq 1
	onee resd 1

section .text 
	global main
	extern printf,scanf

main:
	push n
	push inp
	call scanf
	add esp,8
	;start with 1
	mov dword[i],1
	;for comparison
	mov ebx,dword[n]
	;for division
	mov dword[onee],1

lp1:	cmp dword[i],ebx
	jg end
	fact dword[i]
	;push calculated factorial
	fild dword[fres]
	;push 1
	fild dword[onee]
	;divide it
	fdiv st0,st1
	;load old result
	fld qword[res]
	;update result
	fadd st0,st1
	;store result
	fstp qword[res]
	;empty garbage
	fstp qword[dump]
	fstp qword[dump]
	;increment the number
	inc dword[i]
	jmp lp1

end:	
	fld qword[res]
	sub esp,8
	fst qword[esp]
	push ou
	call printf
	add esp,12
	ret
