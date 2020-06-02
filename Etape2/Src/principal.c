#include "gassp72.h"
//tests fonction somme
//extern int somme(int);
//tests dft
extern int m2(int k, int*signal);
extern int TabSig;




int main(){

	/*int min = 1;
	int max = 0;
	
	for( int i=0;i<10;i++ ){
		
		if(somme(i)>max){
			max=somme(i);
		}
		
		else if(somme(i)<min){
			min=somme(i);
		}
	}*/
	int k =24;
	k = m2(k,&TabSig);
	
	while	(1){}
}
