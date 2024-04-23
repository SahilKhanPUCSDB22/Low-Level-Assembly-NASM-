#include<stdio.h>
#include<stdlib.h>
int a=10;
int b=0;
int c;
void main()
{
	asm("pushl %eax \n\t"
	    "movl a,%eax \n\t"
	    "decl a \n\t"
	    "movl a,%ebx \n\t"
	    "movl b,%ecx\n\t"
	    "lp1: \n\t" 
	    "cmpl %ebx,%ecx \n\t"
	    "je end \n\t"
	    "mull %ebx \n\t"
	    "decl %ebx \n\t"
	    "jmp lp1 \n\t"
	    "end: \n\t"
	    "movl %eax,c \n\t"
	    "popl %eax \n\t");
	printf("%d",c);
}
