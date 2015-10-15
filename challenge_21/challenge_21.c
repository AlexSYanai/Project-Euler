#include <stdio.h> 

int factor(int n);

int main(void) 
{
	int i, factor_one, factor_two; 
	int sum = 0;

	for (i = 1; i < 10000; i++) { 
		factor_one = factor(i); 
		factor_two = factor(factor_one); 
		if (i != factor_one && i == factor_two) sum += i; 
	} 

	printf("%d\n", sum); 
	return 0; 
} 

int factor(int n) 
{ 
	int i;
	int sum = 0; 

	for (i = 1; i < n; i++) { 
		if (n % i == 0) sum += i; 
	} 

	return sum; 
}