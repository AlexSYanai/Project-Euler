#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int letter_sum(int i);
static int ones[] 		= {0, 3, 3, 5, 4, 4, 3, 5, 5, 4};
static int teens[]    = {3, 6, 6, 8, 8, 7, 7, 9, 8, 8};
static int tens[] 		= {6, 6, 5, 5, 5, 7, 6, 6}; 
static int hundreds[] = {10, 10, 12, 11, 11, 10, 12, 12, 11};
	
int main(void)
{
	int sum = 11;
	int i, ten, hundred;

	for (i = 1; i < 1000; i++){
		if (i < 10) {
			sum += letter_sum(i);
		} else if (i >= 10 && i < 20) {
			sum += letter_sum(i);
		} else if (i >= 20 && i < 100) {
			sum += letter_sum(i);
		} else {
			ten     = i % 100;
			hundred = (i - ten)/100;

			if (i % 100 != 0) sum += 3;
			sum += letter_sum(ten) + hundreds[hundred-1];
		}
	}

	printf("%d\n", sum);
	return 0;
}
	
int letter_sum(int i) 
{
	int one, ten;
	int result = 0;

	if (i >= 0 && i < 10) {
		result = ones[i];
	} else if (i >= 10 && i < 20) {
		result = teens[i - 10];
	} else {
		one     = i % 10;
		result += ones[one];
		ten     = (i - one)/10;
		result += tens[ten-2];
	}

	return result;
}
