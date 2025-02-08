#include<stdio.h>

int main()
{
 int plhthos1,plhthos2,plhthos3,meres,x;
 float pososto1,pososto2,pososto3;
 plhthos1=0;
 plhthos2=0;
 plhthos3=0;
 meres=0;
 printf("dose thermokrasia \n");
 scanf("%d",&x);
 while (x!=1000){           
 	if(x<40){
 		plhthos1++;
	 }
 	else if(x==40){
 		plhthos2++;
	 }
	 else {
	 	plhthos3++;	 
	 }
	 meres++;
	  printf("dose thermokrasia \n");
      scanf("%d",&x);
	 
 }
    pososto1=(plhthos1/(float)meres)*100;
     pososto2=(plhthos2/(float)meres)*100;
	 pososto3=(plhthos3/(float)meres)*100;
	 printf("%f\n",pososto1);
	 printf("%f\n",pososto2);
	 printf("%f\n",pososto3);
	 return 0;
	 
	 
	 }
