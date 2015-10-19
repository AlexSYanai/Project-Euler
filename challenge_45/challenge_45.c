#include <stdio.h>
#include <math.h>

int is_pent(unsigned long n);
unsigned long gen_hex(unsigned long n);

int main(void)
{
  unsigned long i = 144;
  unsigned long h;
    
  do {
    h = gen_hex(i);
    i++;
  } while(!(is_pent(h)));

  printf("%lu\n", h);
  return 0;
}

int is_pent(unsigned long n)
{
  unsigned long sq = sqrt(1+24*n);
  return sq*sq == 1 + 24*n && (1 + sq) % 6 == 0;
}

unsigned long gen_hex(unsigned long n)
{
  return n * (2 * n - 1);
}