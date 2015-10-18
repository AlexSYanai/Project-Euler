#include <stdio.h>

int check_prime(int a, int b);

int main(void)
{
  int i, j;
  int max   = 0;
  int prod  = 0;
  int prime = 0;

  for (i = -999; i < 1000; i++) {
    for (j = -999; j < 1000; j++) {
      prime = check_prime(i, j);

      if (max < prime) {
        max  = prime;
        prod = i * j;
      }
    }
  }

  printf("%d\n", prod);
  return 0;
}

int check_prime(int a, int b)
{
  int i, j;
  int num = 0;

  for (i = 0; i < 1000; i++) {
    num = (i * i) + (a * i) + b;

    if (num % 2 == 0 || num < 2) {
      return i;
    } else {
      for (j = 2; j < num; j++) {
        if (num % j == 0) return i;
      }
    }
  }
}