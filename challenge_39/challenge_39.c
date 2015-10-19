#include <stdio.h>
#define LIM 1000

static int n_range[LIM+1] = {0};
int num_check(int i, int j, int k);
int find_max(void);

int main(void)
{
  int a, b, c, i;

  for (a = 1; a < 400; a++) {
    for (b = a; b < 400; b++) {
      for (c = b; c < 400; c++) {
        n_range[a+b+c] += num_check(a,b,c);
      }
    }
  }

  i = find_max();
  printf("%d\n", i);
  return 0;
}

int num_check(int i, int j, int k)
{
  if ((i*i) + (j*j) == (k*k) && i + j + k < LIM) {
    return 1;
  } else {
    return 0;
  }
}

int find_max(void)
{
  int i;
  int max_val   = 0;
  int max_index = 0;

  for (i = 1; i <= LIM; i++) {
    if (n_range[i] > max_val) {
      max_val = n_range[i];
      max_index = i;
    }
  }

  return max_index;
}