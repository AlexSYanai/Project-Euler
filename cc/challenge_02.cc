#include <iostream>

int Fib(const int n) {
  int sum_evens = 0;
  int val_1     = 1;
  int val_2     = 1;

  while (val_2 < n) {
    int temp = val_1 + val_2;

    if (temp % 2 == 0) {
      sum_evens += temp;
    }

    val_1 = val_2;
    val_2 = temp;
  }

  return sum_evens;
}

int main() {
  std::cout << Fib(4000000) << std::endl;

  return 0;
}
