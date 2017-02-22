#include <cassert>
#include <iostream>

template <typename T>
T SumSquareDiff(const T lim) {
  T sum_of_squares = 0;
  T square_of_sum  = 0;

  for (int i = 1; i <= lim; ++i) {
    sum_of_squares += i * i;
    square_of_sum  += i;
  }

  return (square_of_sum * square_of_sum) - sum_of_squares;
}

int main() {
  assert(SumSquareDiff(10) == 2640);
  std::cout << SumSquareDiff(100l) << std::endl;

  return 0;
}
