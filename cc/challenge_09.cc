#include <iostream>

bool IsPythagoreanTriplet(const int i,const int j,const int k) {
  return (i * i) + (j * j) == (k * k);
}

bool CheckTriplet(const int i, const int j, const int k) {
  return k > j && IsPythagoreanTriplet(i,j,k);
}

int FindTriplet() {
  for (int i = 1; i < 333; ++i) {
    for (int j = i; j < 500; ++j) {
      int k = 1000 - i - j;

      if (CheckTriplet(i,j,k)) {
        return i * j * k;
      }
    }
  }

  return -1;
}

int main() {
  std::cout << FindTriplet() << std::endl;

  return 0;
}
