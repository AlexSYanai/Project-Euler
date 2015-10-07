#include "stdio.h"

int main()
{
	int i,j,k;

	for (i = 1; i < 333; i++) {
		for (j = i+1; j < 500; j++) {
			k = 1000-i-j;
			if (k > j) {
			  if (i*i+j*j == k*k) {
			  	printf("%d\n", i*j*k);
			  	break;
			  }
			}
		}
	}

	return 0;
}
