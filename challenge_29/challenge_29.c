#include <stdio.h>
#include <math.h>
#include <stdbool.h>
#define LIM 10001

int unique_els(double *nums);
bool is_el_in_array(double val, double *arr);

int main()
{
  int i = 0;
  int a = 2, b = 2;
  double temp = 0;
  double nums[LIM] = {0};

  for(a = 2; a <= 100; a++) {
    for(b = 2; b <= 100; b++) {
      temp = pow(a,b);
      if (!is_el_in_array(temp, nums)) nums[i] = temp;
      i++;
    }
  }

  printf("%d\n", unique_els(nums));
  return 0;
}

int unique_els(double *nums)
{
  int i;
  int final = 0;

  for (i = 0; i < LIM; i++) {
    if (nums[i] != 0) final++;
  }

  return final;
}

bool is_el_in_array(double val, double *arr)
{
  int i;

  for (i=0; i < LIM; i++) {
    if (arr[i] == val) return true;
  }

  return false;
}
