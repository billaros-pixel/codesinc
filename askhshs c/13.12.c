#include <stdio.h>
#define vasikos 1200
int main(){
int epipedo,years; 
float epidoma_spoudwn,epidoma_years,krathseis,mhniaies;	
printf("parakalw peite to epipedo sas\n");
scanf("%d",&epipedo);
printf("posh ebeireia exeis mysty mou\n");
scanf("%d",&years);
if(epipedo=1){
	epidoma_spoudwn=0;
	
}	
else if(epipedo=2){
	epidoma_spoudwn=0.2*vasikos;
}	
else{
	epidoma_spoudwn=0.25*vasikos;
}
if(years<=5){
	epidoma_years=0.15*vasikos;
}
else if(years<=15){
	epidoma_years=0.25*vasikos;
}
else{
	epidoma_years=0.35*vasikos;
}
krathseis=(epidoma_spoudwn+epidoma_years)*0.24+vasikos*0.1;
mhniaies=vasikos+epidoma_spoudwn+epidoma_years-krathseis;
printf("h krathseis sas einai:%f\n",krathseis);
printf("oi kathares sas apodoxes  tha einai:%f\n",mhniaies);
return 0;


















































































































































































































































	
	
	
	
	
}
