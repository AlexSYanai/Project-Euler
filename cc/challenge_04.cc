#include <iostream>

int ReverseNum(const int n) {
  bool is_pos   = n >= 0;
  int remainder = n;
  int reversed  = 0;

  while (remainder) {
    reversed   = reversed * 10 + remainder % 10;
    remainder /= 10;
  }

  return is_pos ? reversed : reversed;
}

bool IsPalindrome(const int n) {
  return n == ReverseNum(n);
}

int NumPalindrome(const int lim) {
  for (int outer = lim; outer > 900; --outer) {
    for (int inner = lim; inner > 900; --inner) {
      int combined = outer * inner;

      if (IsPalindrome(combined)) {
        return combined;
      }
    }
  }

  return -1;
}

int main() {
  std::cout << NumPalindrome(999) << std::endl;

  return 0;
}
