#include <stdio.h>

int main(void)
{
  int i;
  int final      = 2;
  int tens_val   = 0;
  int num1[1000] = {0};
  int num2[1000] = {0};
  int sum[1000]  = {0};

  num1[0] = 1;
  num2[0] = 1;

  for (;;) {
    for (i = 0; i < 1000; i++) {
      sum[i] = num1[i] + num2[i] + tens_val;
      tens_val = 0;

      if (sum[i] / 10 != 0) {
        tens_val = sum[i] / 10;
        sum[i]  %= 10;
      }
    }

    for (i = 0; i < 1000; i++) {
      num1[i] = num2[i];
      num2[i] = sum[i];
    }

    final++;
    if (num2[999] != 0) break;
  }

  printf("%d\n", final);
  return 0;
}
