#include<stdlib.h>

char* myitoa(int a);
int myatoi(char*c);
int gnum(char*c , int l);
int cal(char*c , int l);
int mylen(char* c);
void scat(char* a , char* b);

char *myitoa(int a)
{
	int i=10;
	int count=1;
	while(a%i!=a)
	{
		i=i*10;
		count++;
	}
	
	int x;

	if((x=a)<0)
	{
		x=x*(-1);
	}

	char *str=(char*)malloc(sizeof(char)*(count+2));
	
	i=0;
	int n=10;

	if(x<10)
	{
		str[i++]=x+48;
	}
	else
	{
		do
		{
			str[i++]= x%10 + 48;
			x=x/10;
		}while(x>0);
	}

	if(a<0)
	{
		str[i++]='-';
	}
	
	str[i]='\0';

	i=0;
	x=mylen(str);
	x--;
	while(i<=x)
	{
		char temp=*(str+i);
		*(str+i)=*(str+x);
		*(str+x)=temp;
		i++;
		x--;
	}
	return str;
}

int myatoi(char *c)
{
	long l=mylen(c);
	return gnum(c,l);	
}

int gnum(char *c , int l)
{
	long re;
	if(*(c)=='\0')
	{
		re=0;
	}
	else 
	{
		re=cal(c,(l-1))+gnum(c+1 ,(l-1)) ;
	}
	return re;
}

int cal(char *c , int len)
{
	long re;
	if (len==0)
	{
		re=*(c)-48;
	}
	else 
	{
		re=10 * cal(c,(len-1));
	}
	return re;
}


int mylen(char* c)
{
	int i=0;
	while(*(c+i)!='\0')
	{
		i=i+1;
	}
	return i;
}

void scat(char *a , char* b)
{
	int size=mylen(a)+mylen(b)+1;
	
	a=realloc(a,size);

	int i=mylen(a);
	int j=0;
	while(b[j]!='\0')
	{
		a[i]=b[j];
		i++;
		j++;
	}
	a[i]='\0';
}
