#include <stdio.h>

int main() 
{ 
 	int i, count, den, rem;

 	for (i = 999; i > 940; i -= 2) { 
 		if (i % 5 == 0) continue; 
 		
 		den = 1; 
 		rem = den % i; 
 		den = (den % i)*10; 

 		for (count = 0; count <= i; count++) { 
 			if (den >= i) den %= i; 
 			if(den == rem) break; 

 			den *= 10; 
 		} 

 		if (count + 2 == i) { 
 			printf("%i\n", i); 
 			break; 
 		} 
 	} 

 	return 0; 
}
