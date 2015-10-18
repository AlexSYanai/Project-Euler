#include <stdio.h>
#include <stdlib.h>
#include <math.h>

static int abundant_nums[28123] = {0};
int mark_abundant(int n);
int check_num(int j);

int main(void) 
{
  int i;
  int final = 0;

  for (i = 2 ; i < 28123 - 12; i++) {
    if (check_num(i) > i) abundant_nums[i]++;
  }

  for (i = 1 ; i < 28123 ; i++) {
    final += mark_abundant(i);
  }

  printf("%d\n", final);
  return 0;
}

int mark_abundant(int n) 
{
  int i = 12;

  while (i < n) {
    if (abundant_nums[n - i]) return 0;

    for (i++; i < 28123; i++) {
      if (abundant_nums[i]) break;
    }
  }

  return n;
}

int check_num(int j) 
{
  int i;
  int sum = 1;
  
  for (i = 2; i <= j / 2; i++) {
    if (j % i == 0) sum += i;
  }

  return sum;
}