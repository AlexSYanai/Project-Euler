#ifndef SIEVE_H
#define SIEVE_H

#include <vector>
#include <cmath>

template <typename T>
std::vector<T> Sieve(const T n) {
  const int lim = ceil(sqrt(n));
  std::vector<T> primes(n, true);

  for (int i = 2; i < lim; ++i) {
    if (primes[i]) {
      for (int j = i * i; j < n; j += i) {
        primes[j] = false;
      }
    }
  }

  std::vector<T> output;

  for (int i = 2; i < n; ++i) {
    if (primes[i]) {
      output.emplace_back(i);
    }
  }

  return output;
}

#endif // SIEVE_H