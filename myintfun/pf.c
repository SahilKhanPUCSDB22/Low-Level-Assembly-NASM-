#include<unistd.h>
#include<stdarg.h>
#include"lib.c"

void mypr(char* str,...)
{
	int i=0;
	int count=0;

	va_list args;

	va_start(args, str);
	
	int l= mylen(str);
	int argl;

	char *out = malloc(sizeof(char)*l);

	i=0;
	int j=0;
	char *ar;
	while(str[i]!='\0')
	{
		if(str[i]=='%')
		{
			out[j]='\0';
			if(str[i+1]=='d')
			{
				//convert the argument
				ar = myitoa(va_arg(args,int));
				argl=mylen(ar);
	
			}
			if(str[i+1]=='c')
			{
				char x=va_arg(args,int);
				char *tmp=malloc(sizeof(char)*2);
				tmp[0]=x;
				tmp[1]='\0';
				ar=tmp;
				argl=1;
			}
			if(str[i+1]=='s')
			{
				ar=(va_arg(args,char*));
				argl=mylen(ar);			
			}
			
			scat(out,ar);
			out=realloc(out,l+argl);		
	
			j=j+1;
			i=i+1;

		}
		else
		{
			out[j]=str[i];
			j++;
		}
		
		i++;
	}
	va_end(args);
	write(1,out,j);
}
