%macro length 2
	mov eax,%1
	mov ebx,0
	
lp1:	cmp dword[eax],-1
	je mend
	add eax,4
	inc ebx
	jmp lp1
mend:	mov dword[%2],ebx
%endmacro


%macro part 4
	mov ecx,%2
	mov ebx,ecx
	dec ebx

	mov eax,%3
	mul 4
	add eax,%1
	mov edx,dword[eax]
	mov dword[pivot],edx
	xor edx,edx

here:	cmp ecx,%3
	je end
	mov eax,ecx
	mul 4
	add eax,%1
	mov esi,dword[eax]
	cmp esi,dword[pivot]
	jl swapgo
swapbk:	inc ecx
	jmp here

swapgo: 
	inc ebx
	swap %1,ebx,ecx
	jmp swapbk

end:
	inc ebx
	swap %1,ebx,ecx
	mov %4,ebx

%endmacro

%macro swap 3
	mov eax,%2
	mul 4
	add eax,%1
	mov esi,eax

	mov eax,%3
	mul 4
	add eax,%1
	mov edi,eax

	mov eax,dword[esi]
	mov edx,dword[edi]
	mov dword[esi],edx
	mov dword[edi],eax
%endmacro

section .data
	array dd 10,4,25,6,45,78,65,2,43,100,24,52,-1
	pr db "%d",0

section .bss
	len resd 1
	pivot resd 1
	partition resd 1
	
section .text
	global main
	extern printf
main:
	length array,len
	dec dword[len]
	
	
	
	
