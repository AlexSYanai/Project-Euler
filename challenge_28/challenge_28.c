#include <stdio.h>

int main(void)
{
	int i,val;
	int sum = 1;

	for (i = 1; i < 501; i++) {
		val = ((2*i)+1);
		sum += 4 * val * val - (12 * i);
	}

	printf("%d\n", sum);
	return 0;
}
