class TruncatablePrimes
  def initialize
    @search_range    = (3..(Math.sqrt(finish).floor + 1))
    @prime_array     = search_range.step(2).to_a.insert(0,2)
    @sum_truncatable = 0
  end

  def sieve_of_eratosthenes
    (4..prime_array.last).each { |counter| prime_array.delete_if { |number| number % counter == 0 && number > counter } }
  end

  def is_
end
