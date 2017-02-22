#include <cassert>
#include <iostream>

#include "sieve.h"

int FirstNPrimes(const int n) {
  std::vector<int> primes = Sieve(n * 11);
  return primes.at(n - 1);
}

int main() {
  assert(FirstNPrimes(6) == 13);
  std::cout << FirstNPrimes(10001) << std::endl;

  return 0;
}
