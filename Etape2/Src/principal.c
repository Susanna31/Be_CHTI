#include "gassp72.h"
//tests fonction somme

extern int somme(int);

int main(){

	int min = 1;
	int max = 0;
	
	for( int i=0;i<10;i++ ){
		
		if(somme(i)>max){
			max=somme(i);
		}
		
		else if(somme(i)<min){
			min=somme(i);
		}
	}
	
	while	(1){}
}
