#include<stdio.h>
#include<assert.h>
void main()
{
	FILE *fd=fopen("c.c","r");
	assert(fd!=NULL);
}

