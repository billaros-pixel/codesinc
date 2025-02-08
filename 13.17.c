#include <stdio.h>

int main ()
{
 int a;
 float kostos;
 printf("parakalo dose ths hmeres ths diamonhs \n ");
 scanf("%d",&a);
 if (a<=2)
 { kostos=a*50; 	
 }
	else if (a<=6)
	{
		kostos=a*45;
	}
  else {
  	kostos=a*40;
  }
	kostos=(10/(float)100)*kostos+kostos;
	printf("%f",kostos);
	return 0;
}
