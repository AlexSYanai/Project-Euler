#include <iostream>
#include <vector>

#include "sieve.h"

int LargestPrimeFactor(long n) {
  int prime_limit         = ceil(sqrt(n));
  std::vector<int> primes = Sieve(prime_limit);

  for (int i = primes.size() - 1; i >= 0; --i) {
    if (n % primes[i] == 0) {
      return primes[i];
    }
  }

  return 1;
}

int main() {
  long lim = 600851475143;
  std::cout << LargestPrimeFactor(lim) << std::endl;

  return 0;
}