%macro fact 2
 
mov eax,1
mov ecx,%1
 
lp:mov esi,ecx
mul esi
loop lp
mov %2 ,eax
%endmacro

section .data
msg db "%d",10,0
 
section .text
global main
extern printf
main:
fact 5,ecx
push ecx
push msg
call printf
add esp,8

