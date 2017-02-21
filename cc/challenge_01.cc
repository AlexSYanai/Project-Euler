#include <iostream>

int SumBelow(const int n) {
  int sum = 0;

  for (int i = 0; i < n; ++i) {
    if (i % 5 == 0 || i % 3 == 0) {
      sum += i;
    }
  }

  return sum;
}

int main() {
  int ans = SumBelow(1000);
  std::cout << ans << std::endl;
  
  return 0;
}
