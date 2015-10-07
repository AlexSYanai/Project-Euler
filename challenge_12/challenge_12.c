#include <stdio.h>
#include <limits.h>

#define LIM 500
int factor(unsigned long n);

int main(void)
{
  int count;
  unsigned long i, tri_num = 0;

  for (i = 1; i < ULONG_MAX; i++) {
    tri_num += i;

    // Bitwise AND comparison
    if (i & 1) {
      count = factor(i) * factor((i+1)/2);
    } else {
      count = factor(i/2) * factor(i+1);
    }

    if (count > LIM) {
      printf("%ld\n", tri_num);
      return 0;
    }

    count = 0;
  }

  return 0;
}

int factor(unsigned long n)
{
  unsigned long k;
  int count = 2;

  for (k = 2; k < n; k++)
    if (n % k == 0) count++;

  return count;
}