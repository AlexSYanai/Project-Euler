require 'mathn'
class PandigitalPrime
  attr_accessor :permutations, :high_prime, :number_strings
  def initialize
    @number_strings  = %w(1 2 3 4 5 6 7 8 9)
    @permutations    = []
    @high_prime      = 0
  end

  def check_numbers
    (1..9).each do |x|
      (number_permutations(number_strings[0..-x])).each do |n|
        @high_prime = n.join("").to_i if is_prime?(n.join("").to_i) 
        return if high_prime > 0
      end
    end
  end

  def number_permutations(num_string)
    num_string.permutation.to_a.reverse
  end

  def is_prime?(num)                # Had to use Ruby Mathn library; generating a list
    high_prime << num if num.prime? # of primes below 987654321 took too long
  end
end

euler = PandigitalPrime.new
euler.check_numbers
p euler.high_prime
