#include <stdio.h>

double factorial(int n);

int main() 
{ 
	double a,b;

	a = factorial(40); 
	b = factorial(20) * factorial(20);

	printf("%F\n", a/b); 
	return 0; 
} 

double factorial(int n) 
{ 
	if (n <= 1) {
		return 1;
	}

	return n * factorial(n-1); 
} 
