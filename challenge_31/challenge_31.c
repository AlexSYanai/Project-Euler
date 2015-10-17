#include <stdio.h>

int main(void)
{
  int coins[] = { 1, 2, 5, 10, 20, 50, 100, 200 };
  int ways[201] = {0};
  int i,j;

  ways[0] = 1;
  for (i = 0; i < 8; i++) {
    for (j = coins[i]; j < 201; j++) {
      ways[j] += ways[j - coins[i]];
    }
  }

  printf("%d\n", ways[200]);
  return 0;
}
