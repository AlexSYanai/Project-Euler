#include <stdio.h>

int factorial(int n);

int main(void)
{
  int i, j, k;
  int sum = 0;
  char buf[16];

  for (i = 3; i < 100000; i++) {
    k = 0;
    snprintf(buf, 16, "%u", i);

    for (j = 0; buf[j] != 0; j++) {
      k += factorial(buf[j]-'0');
    }

    if (i == k) sum += k;
  }

  printf("%d\n", sum);
  return 0;
}

int factorial(int n)
{
  int i = 1;

  while (n != 0) {
    i *= n--;
  }

  return i;
}