#include <stdio.h>
#include <math.h>

int dec_inc(int i, int j, int digits);

int main(void)
{
  int decs[7];
  int final = 1;
  int current = 1;
  int i, j, x, digits;

  for (i = 1, x = 0; x < 7; i++) {
    digits = log10(i)+1;

    for (j = 0; j < digits; j++, current++) {
      if (current == pow(10, x)) {
        decs[x++] = dec_inc(i, j, digits);
      }
    }
  }

  for (i = 0; i < x; i++) {
    final *= decs[i];
  }

  printf("%d\n", final);
  return 0;
}

int dec_inc(int i, int j, int digits)
{
  return (i / (int)pow(10, (digits-j-1))) % 10;
}