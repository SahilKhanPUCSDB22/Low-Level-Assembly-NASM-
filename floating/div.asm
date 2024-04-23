section .data
	a dq 10.0
	b dq 3.0
	msg db "%f",10,0
	
section .text
	global main
	extern printf
	
main:
	fld qword[b]
	fld qword[a]
	fdiv st1
	sub esp,8
	fst qword[esp]
	push msg
	call printf
	add esp,12
	ret
	
