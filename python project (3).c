#include <stdio.h>
void  calculations(float table[],int N,float *mo,float *max, float *min){
	float sum=0;
	int i;
	for(i=0;i<N;i++){
		sum=sum+table[i];
	}
	*mo=sum/N;
	*max=table[0];
	*min=table[0];
	for(i=1;i<N;i++){
		if(table[i]>*max){
			*max=table[i];
		}
		if(table[i]<*min){
			*min=table[i];
		}
	}
}
int main(){
float max,mo,min;
int i=0;
int k=0;
float table[100];    
printf("doste th timh tou emporevmatos:\n");
scanf("%f",&table[i]);
while((table[i]!=-1)&&(i<100)){
	i++;
	k++;
	printf("doste th timh tou emporevmatos:\n");
	scanf("%f",&table[i]);
	}
  calculations(float table[], int k, float &mo, float &max, float &min);
  printf("o mesos oros twn arithmwn einai:%f\n",mo);
  printf("to megisto stoixeio tou pinaka einai:%f\n",max);  
  printf("to mikrotero stoixeio tou pinaka einai:%f\n",min);
  return 0;

















}











