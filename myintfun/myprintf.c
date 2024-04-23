#include<stdio.h>

int mypr(char *s ,...);

int main()
{
	int x=10;
//	scanf("%d",&x);
	char z[]="sahil";
	mypr("%d%c%s",x,'r',&z);
	return 0;
}
