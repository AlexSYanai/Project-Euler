#include <stdio.h>
#include <math.h>
#include <limits.h>
#define LIM 10000

static unsigned gen_pent(unsigned n);
static int is_pent(unsigned n);

int main(void)
{
  unsigned i, j, a, b;
  unsigned min = UINT_MAX;

  for (i = 1; i < LIM; i++) {
    for (j = i; j < LIM; j++) {
      a = gen_pent(i);
      b = gen_pent(j);

      if (is_pent(a+b) && is_pent(b-a)) {
        if (b-a < min) min = b-a;
      }
    }
  }

  printf("%u\n", min);
  return 0;
}

unsigned gen_pent(unsigned n)
{
  return n*(3*n-1)/2;
}

int is_pent(unsigned n)
{
  unsigned sq = sqrt(1+24*n);
  return sq*sq == 1+24*n && (1+sq) % 6 == 0;
}