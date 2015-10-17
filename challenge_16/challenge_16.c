#include <stdio.h>
#define LIM 350

// Addition like on paper, identical solution to 20
int main()
{
  int tens[LIM] = {1};
  int i, j, x, y;
  int sum = 0;

  for (i = 0; i < 1000; i++) {
    for (j = 0; j < LIM; j++) {
      tens[j] *= 2;
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
