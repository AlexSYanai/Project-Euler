class FindPrime
  attr_accessor :counter,:first_factor,:high_number
  attr_reader   :prime_array,:finish
  def initialize(finish)
    @finish = finish
    @prime_array = []
    @high_number = 120
  end

  def four_distinct_prime_factors
    prime_counter = 1
    while prime_counter < 4
      @high_number += 1
      find_distinct_prime_factors(high_number) >= 4 ? prime_counter += 1 : prime_counter = 0
    end
    @first_factor = (high_number-3)
  end

  def find_distinct_prime_factors(num)
    @nod = 0
    @pf = true
    @remain = num

    prime_array.each do |n|
      return @nod += 1 if (n**2) > num
      @pf = false
      while @remain % n == 0
        @pf = true
        @remain /= n
      end
      @nod += 1 if @pf
      return @nod if @remain == 1
    end
    @nod
  end

  def sieve_of_eratosthenes
    (0..finish).each { |i| prime_array[i] = i+2 }
    index = 0
    while prime_array[index]**2 <= prime_array.last
      @prime_array = prime_array.select { |x| x == prime_array[index] || x % prime_array[index] != 0 }
      index += 1
    end
  end
end

euler = FindPrime.new(1000000)
euler.sieve_of_eratosthenes
euler.four_distinct_prime_factors
p euler.first_factor
