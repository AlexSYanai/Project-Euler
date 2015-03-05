class PrimePermutation
  attr_accessor :prime_array,:prime_hash,:final_string

  def initialize(finish)
    @prime_array  = (1..finish).step(2).to_a.insert(0,2)
    @prime_hash   = {}
  end

  def find_four_primes
    prime_hash.each do |key,value|
      if value.length == 3
        return @final_string = value.sort.join("") if subtract_primes(value.sort)
      end
    end
  end

  def subtract_primes(value)
    (value[2] - value[1]) == (value[1] - value[0])
  end

  def find_permutations
    prime_array.each do |prime|
      @prime_hash[prime] = []
      set_permutations(prime,prime.to_s.split("").sort) unless prime.to_s[0] == "0"
    end
  end

  def set_permutations(prime,sorted)
    prime_array.each { |second| @prime_hash[prime] << second if sorted == second.to_s.split("").sort unless prime == second }
  end

  def sieve_of_eratosthenes
    (4..prime_array.last).each { |counter| prime_array.delete_if { |num| num % counter == 0 && num > counter }.delete_if { |num| num.to_s.length != 4 } }
  end
end

euler = PrimePermutation.new(10000)
euler.sieve_of_eratosthenes
euler.find_permutations
euler.find_four_primes
p euler.final_string
