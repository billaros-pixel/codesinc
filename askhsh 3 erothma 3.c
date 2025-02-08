#include <stdio.h>
#define SIZE 3
int main (){
	
char onomata[SIZE][30];
int grades[SIZE][4],temp;
int i,j,k;
for (i=0;i<SIZE;i++){
	printf("dose onoma foithth\n");
	gets(onomata[i]);
}
for (i=0;i<SIZE;i++){
	for(j=0;j<4;j++){
		printf("dose vathmo foithth\n");
		scanf("%d",&grades[i][j]);
	}
}
	for (k=0;k<=SIZE;k++){
		for(i=0;i<4;i++){
		    for(j=4;j>=i;j--){
		    	if(grades[k][j-1]<grades[k][j]){
		    		temp=grades[k][j-1];
		    		grades[k][j-1]=grades[k][j];
		    		grades[k][j]=temp;
		    		
				}
			}
		}
		
	}
	for(i=0;i<SIZE;i++){
		printf("%s\n",onomata[i]);
	           for(j=0;j<4;j++){
	           	   printf("%d",grades[i][j]);
			   }
	}		

return 0;

}
