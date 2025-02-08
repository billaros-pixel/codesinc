#include <stdio.h>

int main(){

int POP[100],k,i,j,temp1;
for(k=0;k<8;k++){
	scanf("%d",&POP[k]);
	
		for(i=0;i<=k-1;i++){
			for(j=0;j<=8-i-1;j--){
				if(POP[j+1]<POP[j]){
					temp1=POP[j-1];
					POP[j-1]=POP[j];
					POP[j]=temp1;
				}
			}
			
		}
		
		
		
		
		
	
	}
   for(i=0;i<8;i++){
   	printf("%d\n",POP[i]);
   } 
   return 0;
}
