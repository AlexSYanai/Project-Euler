/*          Addition - Like on paper
* Initialize column representing 160 digits for
* the digits in 100!, each column being a 10s
* column in the number. For each value i,
* iterate through each column and, if the value
* is > 10, add the quotient to the next column
* and set the current column to the remainder
*/

#include <stdio.h>
// Cheated a bit here - known: < 160 digits in 100!
#define LIM 160

int main()
{
	int tens[LIM] = {1};
	int i, j, x, y;
	int sum = 0;

	for (i = 0; i < 100; i++) {
		for (j = 0; j < LIM; j++) {
			tens[j] *= (i + 1);
		}

		for (x = 0; x < LIM - 1; x++) {
			if (tens[x] >= 10) {
				tens[x + 1] += tens[x] / 10;
				tens[x] = tens[x] % 10;
			}
		}
	}

	for (y = 0; y < LIM; y++) {
		sum += tens[y];
	}

	printf("%d \n", sum);
	return 0;
}
