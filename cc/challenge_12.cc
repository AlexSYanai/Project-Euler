#include <vector>
#include <iostream>

#include "sieve.h"

int TestTriangle(int tri_num, std::vector<int> &primes) {
  int i     = 0;
  int count = 0;

  std::vector<int> factors;
  std::vector<int> divisors;

  while (tri_num-- > 1) {
    if (tri_num % primes[i] == 0) {
      if 
    }
  }
}

int TriangleNumbers(const int n) {
  std::vector<int> primes = Sieve(n * 25);
  int i = 0;
  int curr = 3;
  int tri_num = 1;

  while (i <= n) {
    tri_num = (curr * (curr + 1) / 2);
    TestTriangle(tri_num, primes);
  }
}

int main() {
  std::cout << TriangleNumbers(500) << std::endl;

  return 0;
}
