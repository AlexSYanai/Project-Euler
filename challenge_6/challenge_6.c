#include <stdio.h>

int main(void) {
	int nums    = 0;
	int squares = 0;
	int final, i;

	for (i = 1; i <= 100; i++) {
		nums += i;
		squares += (i * i);
	}

	final = (nums * nums) - squares;

	printf("%d\n", final);
	return 0;
}