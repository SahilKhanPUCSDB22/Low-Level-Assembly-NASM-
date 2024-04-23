section .data
	a dq 1.3
	b dq 11.5
	d dq 5.5
	e dq 4.0
	msg db "value is %f",10,0

section .bss
	c resq 1

section .text
	global main
	extern printf

main:
	fld qword[b]
;	fld qword[b]
	fmul st0
	fst qword[c]
	fld qword[e]
	fld qword[a]
	fld qword[d]
	fmul st1
	fmul st2
	fld qword[c]
	fsub st1
	fsqrt
	sub esp,8
	fst qword[esp]
	push msg
	call printf
	add esp,12
	ret
