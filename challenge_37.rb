class TruncatablePrimes
  attr_accessor :prime_array,:sum_truncatable
  attr_reader   :upper_bound
  def initialize(finish)
    @upper_bound     = finish
    @prime_array     = []
  end

  def find_truncatable
    p @sum_truncatable = prime_array.select { |i| (0..i.to_s.length-1).all? { |j| is_prime?((i.to_s[0..j].to_i),prime_array) && is_prime?((i.to_s[j..-1].to_i),prime_array) } unless i.to_s.length == 1}.inject(:+)
  end

  def sieve_of_eratosthenes
    (0..upper_bound).each { |i| prime_array[i] = i+2 }
    index = 0
    while prime_array[index]**2 <= prime_array.last
      @prime_array = prime_array.select { |x| x == prime_array[index] || x % prime_array[index] != 0 }
      index += 1
    end
  end

  def is_prime?(target_value,array,low=0,high=array.length) # .include? too slow - binary search ftw
    mid = (low+high)/2
    return false if (high-low) == 1
    return true if target_value == array[mid]
    return true if target_value == 2
    target_value > array[mid] ? is_prime?(target_value,array,mid,high) : is_prime?(target_value,array,low,mid)
  end
end

euler =  TruncatablePrimes.new(1000000)
euler.sieve_of_eratosthenes
euler.find_truncatable
euler.sum_truncatable
