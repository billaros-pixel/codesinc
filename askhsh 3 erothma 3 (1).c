#include <stdio.h>
#define SIZE 3
int main (){

char onomata[SIZE][30];
int grades[SIZE][4],temp;
int i,j,k,l;
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

	for(k=0; k< SIZE; k++) {
        for (i = 0; i < 4; i++) {
            for (j = i +1; j < 4; ++j) {
                if (grades[k][i] < grades[k][j])  {
                    temp = grades[k][i];
                    grades[k][i] = grades[k][j];
                    grades[k][j] = temp;
       }
     }
   }
}
	for(i=0;i<SIZE;i++){

                printf("%s\n",onomata[i]);
	           for(j=0;j<4;j++)
	           	   printf("%d     ",grades[i][j]);
                   printf("\n");
	}

return 0;

}
