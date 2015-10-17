#include <stdio.h>

int main(void) {
  int year;
  int sundays       = 0;
  int current_date  = 1;
  int current_month = 0;
  int month[12]     = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };

  for (year = 1900; year < 2001; year++) {
    for (current_month = 0; current_month <= 11; current_month++) {
      if (current_date % 7 == 0 && year != 1900) {
        sundays += 1;
        current_date = 0;
      }

      if (current_month != 1) {
        current_date += month[current_month];
      } else {
        if (year % 4 == 0) {
          if (year % 100 != 0 || year % 400 == 0) {
            current_date += 29;
          } else {
            current_date += month[current_month];
          }
        } else {
          current_date   += month[current_month];
        }
      }
    }
  }

  printf("%d\n", sundays);
}
