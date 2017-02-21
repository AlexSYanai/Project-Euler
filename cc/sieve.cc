#include <vector>
#include <cmath>
#include <cassert>

#include "sieve.h"

void Test(const std::vector<int> &A) {
  std::vector<int> prime_outputs = {2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97};

  for (int i = 0; i < prime_outputs.size(); ++i) {
    assert(A[i] == prime_outputs[i]);
  }
}

int main() {
  std::vector<int> out = Sieve(100);
  Test(out);

  return 0;
}
