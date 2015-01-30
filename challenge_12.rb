def num_divisors(n)
  count = 0
  divisors = 1
  p = 3

  if n % 2 == 0
    n = n/2
    while n % 2 == 0
      count += 1
      n /= 2
    end
    divisors *= (count + 1)
  end

  until n == 1
    count = 0
    while n % p == 0
      count += 1
      n /= p
    end
    divisors *= (count + 1)
    p += 2
  end
  divisors
end

def find_triangular_index
  n = 1
  lower_number = num_divisors(n)
  higher_number = num_divisors(n+1)

  while lower_number * higher_number < 500
    n += 1
    lower_number = higher_number
    higher_number = num_divisors(n+1)
  end
  n
end

p (find_triangular_index * (find_triangular_index + 1)) / 2
