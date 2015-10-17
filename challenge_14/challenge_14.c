#include <stdio.h>

int main(int argc, char *argv[])
{
  int n, longest = 0, terms = 0;
  long i,j;

  for (i = 1; i <= 1000000; i++) {
    n = 1;
    j = i;

    while (j != 1) {
      n++;

      if (n > terms) {
        terms = n;
        longest = i;
      }

      if (j % 2 == 0) {
        j = j / 2;
      } else {
        j = 3 * j + 1;
      }
    }
  }

  printf("%d\n", longest);
  return 0;
}
