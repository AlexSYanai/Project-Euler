#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void sieve_primes(int lim);
int final;

int main(int argc, char *argv[])
{
	int lim = 110000;

	sieve_primes(lim);
	printf("%d\n",final);

	return 0;
}

void sieve_primes(int lim)
{
	int count = 2; // There's no 2 or 3 so count is initialized at 2
	int i, j, k, x, y, z, finish;
	unsigned char *primes;

	// Initialize the array 
	primes = (unsigned char *)calloc(lim+1, sizeof(unsigned char));
	finish = sqrt(lim);
	
	// Atkin Sieve => All modulos related to 60 are checked here
	for(x = 1; x <= finish; x++) {
		for(y = 1; y <= finish; y++) {
			z = 4*x*x + y*y;
			if(z <= lim && (z % 12 == 1 || z % 12 == 5)) primes[z] = !primes[z];

			z = 3*x*x + y*y;
			if(z <= lim && z % 12 == 7) primes[z] = !primes[z];

			z = 3*x*x - y*y;
			if(x > y && z <= lim && z % 12 == 11) primes[z] = !primes[z];
		}		
	}
	
	// then the candidates are squared and the results are marked false
	for(i = 5; i <= finish; i++) {
		if(primes[i]==1) {
			for(j = 1; j * i*i <= lim; j++) {
				primes[j*i*i] = 0;	
			}		
		}
	}

	// Loop through the array and count 1's until 10,000
	for(i = 5; i <= lim; i++) {
		if(primes[i] == 1) count += 1;
		if(count == 10001) {
			final = i;
			break;
		}
	}

	free(primes);
}