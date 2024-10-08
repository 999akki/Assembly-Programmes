#include<stdio.h>

int main(){
	int i ,j,k,rows,w,input;
	printf("Enter input value : \n");
	scanf ("%d",&input);

	printf("\n");
	k=0;
	
	rows = input*2-1;

	w = rows/2;
	w++;

	for(i=1; i <=rows ; i++){

		if(i<=w){
			k++;
		}	
		else{
			k--;
		}

		for(j=1; j <=rows; j++){
			
			if(j>=0+k && j<=(rows+1)-k){

				if(i%2!=0){
					if(j%2!=0){
						printf("* ");	
					}
					else{
						printf("  ");
					}
				}
				else{
					if(j%2==0){
						printf("* ");
					}
					else{
						printf("  ");
					}
				}	
			}
			else{
				printf("  ");
			}


		}
		printf("\n");
	}
	return 0;
}
