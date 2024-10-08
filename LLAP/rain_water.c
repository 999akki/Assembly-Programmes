#include<stdio.h>

int rain(int *arr, int n){
	int i,next,cnt,temp,sum;
	next=i=cnt=temp=sum=0;
	
	0 - 1  
	1 - 0 
	2 - 3
	3 - 4
	4 -

	while(i<n){
		if(arr[i]>0){
			temp = arr[i];
			i++;
			if(arr[i] < temp){	
				next = arr[i];	
				sum =sum+temp-next;
				i++;
			}
			next = arr[i];
			sum = sum+temp-next;
			i++;
			if(arr[i] < temp){
				next = arr[i];	
				sum =sum+temp-next;
				i++;
			}
			if(arr[i] >= temp){
				sum = sum+0;
			}
			
		}
		i++;
	}
	return sum;
}

int main(){
	int a[]={2,1,0,1,3};

	int size = sizeof(a)/sizeof(int);
	printf("Amount of water trapped by rain water harvesting is : %d \n",rain(a,size));
	return 0;
}
