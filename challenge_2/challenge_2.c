#include <stdio.h>

int main(int argc, char *argv[])
{
  int fib1 = 1;
  int fib2 = 1;
  int sum  = 0;
  int lim  = 0;
  int temp;

  if(argv[1]) lim = atoi(argv[1]);

  while (fib2 < lim)  {
    temp = fib1 + fib2;
    if(temp % 2 == 0) sum += temp;

    fib1 = fib2;
    fib2 = temp;
  }

  printf("%d\n", sum);
  return 0;
}
