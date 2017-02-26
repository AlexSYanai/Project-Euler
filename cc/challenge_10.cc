#include <iostream>

#include "sieve.h"

long SumPrimes(const int lim) {
  long sum = 0;
  std::vector<int> primes = Sieve(lim);

  for (const auto p : primes) {
    sum += p;
  }

  return sum;
}

int main() {
  std::cout << SumPrimes(2000000) << std::endl;

  return 0;
}
