require 'mathn'
class PandigitalPrime
  attr_reader :number_strings
  def initialize
    @number_strings  = %w(1 2 3 4 5 6 7 8 9)
  end

  def check_numbers
    (1..9).each { |x| (number_permutations(number_strings[0..-x])).each { |n| return n.join("").to_i if is_prime?(n.join("").to_i) } }
  end

  def number_permutations(num_string)
    num_string.permutation.to_a.reverse
  end

  def is_prime?(num) # Had to use Ruby Mathn library; generating a list
    num.prime?       # of primes below 987654321 took too long
  end
end

euler = PandigitalPrime.new
p euler.check_numbers
