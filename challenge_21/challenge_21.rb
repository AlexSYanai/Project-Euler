class FindAmicable
  attr_accessor :prime_array, :sum_amicable
  attr_reader :search_range, :finish
  def initialize(finish)
    @finish = finish
    @search_range = (3..(Math.sqrt(finish).floor + 1))
    @sum_amicable = 0
    @prime_array = search_range.step(2).to_a.insert(0,2)
  end

  def amicable_sum_calculator
    (2..finish).each do |counter|
      first_factor_sum = factor_finder(counter)
      if first_factor_sum > counter && first_factor_sum <= finish
        second_factor_sum = factor_finder(first_factor_sum)
        @sum_amicable += counter + first_factor_sum if second_factor_sum == counter
      end
    end
  end

  def factor_finder(factor_sums)
    n = factor_sums
    first_factor, second_factor = 0
    sum = 1
    for i in (4..prime_array.length)
      counter = prime_array[i-4]
      if (n % counter == 0)
        second_factor = counter**2
        n /= counter
        while n % counter == 0
          second_factor *= counter
          n /= counter
        end
        sum *= ((second_factor - 1)/(counter - 1))
      end
    end
    sum *= n + 1 if (n > 1)
    (sum-factor_sums)
  end

  def sieve_of_eratosthenes
    (3..prime_array.last).each { |counter| prime_array.delete_if { |number| number % counter == 0 && number > counter } }
  end
end

euler = FindAmicable.new(10000)
euler.sieve_of_eratosthenes
euler.amicable_sum_calculator
p euler.sum_amicable
