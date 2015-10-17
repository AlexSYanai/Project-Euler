#include <stdio.h>

void fifth_power(int *fifth_pows);
int sum_powers(int n, int *pows);

int main(void)
{
  int n;
  int pows[10];
  int final = 0;

  fifth_power(pows);
  for(n = 3; n < 531441; n++) {
    if(sum_powers(n,pows) == n) final += n;
  }

  printf("%d\n", final);
  return 0;
}

void fifth_power(int *fifth_pows)
{
  int i, j;

  for(i = 0; i < 10; i++) {
    fifth_pows[i] = i;
    for(j = 5; j > 1; j--) {
      fifth_pows[i] *= i;
    }
  }
}

int sum_powers(int n, int *pows)
{
  int sum = 0;

  do {
    sum += pows[n%10];
    n /= 10;
  } while(n);

  return sum;
}
