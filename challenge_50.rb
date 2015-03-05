class PrimeSum
  attr_accessor :prime_array,:result,:prime_sum,:num_primes
  attr_reader   :finish
  def initialize(finish)
    @finish      = finish
    @prime_array = []
    @num_primes  = 0
    @prime_sum    = [0]
  end

  def find_prime_sum
    prime_sum.each_with_index do |sum,i|
      (i - (num_primes + 1)).downto(0) do |num|
        break if (sum - prime_sum[num] > finish)
        if (sum - prime_sum[num]) >= 0 && prime_array.include?((sum - prime_sum[num]))
          @num_primes = i - num
          @result = sum - prime_sum[num]
        end
      end
    end
  end

  def prime_addition
    prime_array.each_with_index { |prime,i| prime_sum[i+1] = prime_sum[i] + prime_array[i] }
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

euler = PrimeSum.new(1000000)
euler.sieve_of_eratosthenes
euler.prime_addition
euler.find_prime_sum
p euler.result
