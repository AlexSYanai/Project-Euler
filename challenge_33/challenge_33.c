#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(void)
{
  int i, j;
  float a, b, c, d, fract1, fract2, final;
  float num_prod = 1.0;
  float den_prod = 1.0;
  char buf_i[5], buf_j[5];

  for (i = 10; i < 99; i++) {
    for (j = 11; j < 110; j++) {
      if (!(i % 10 == 0) && !(j & 10 == 0)) {
        snprintf(buf_i, 5,"%d",i);
        snprintf(buf_j, 5,"%d",j);

        a = buf_i[0] - '0';
        b = buf_i[1] - '0';
        c = buf_j[0] - '0';
        d = buf_j[1] - '0';
        
        if (buf_i[1] == buf_j[0] && buf_i[0] < buf_j[1]) {
          fract1 = a/d;
          fract2 = (float)i/(float)j;
          if (fract1 == fract2) {
            num_prod *= i;
            den_prod *= j;
          }
        }
      }
    }
  }

  printf("%f\n", den_prod/num_prod);
  return 0;
}