#include <stdio.h>
#include <string.h>
#include <stdbool.h>

bool palindrome(int n)
{
 int reverse = 0, temp;
 temp = n;

 while (temp != 0) {
  reverse = reverse * 10;
  reverse = reverse + temp%10;
  temp    = temp/10;
 }

 if (n == reverse) {
  	return true;
  } else {
  	return false;
  }
}

int main(void)
{
	int final;
	int outer = 999;
	int inner = 999;
	bool pal  = false;

	while(outer >= 900) {
		while(inner >= 900) {
			final = outer * inner;
			pal = palindrome(final);
			if (pal) break;

			--inner;
		}
		if (pal) break;

		inner = 999;
		--outer;
	}

	printf("%d\n", final);
	return 0;
}