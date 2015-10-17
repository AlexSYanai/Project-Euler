#include <stdio.h>

int main(void)
{
  int largest;
  int counter = 2;
  long new_num = 600851475143;

  while (counter * counter <= new_num) {
    if (new_num % counter == 0) {
      new_num /= counter;
      largest = counter;
    } else {
      counter += 1;
    }

    if(new_num > largest) largest = new_num;
  }

  printf("%d\n", largest);
  return 0;
}
