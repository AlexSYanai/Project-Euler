class PrimeCache
	attr_accessor :finish
	attr_reader   :primes
	def initialize(finish)
		@finish = finish
		@primes = [2,3]
	end

	def get_primes_upto
		return print_prime_sums if primes.last == finish 
		primes.last > finish ? @primes.select(:<) : (@primes.last..finish).step(2).map { |x| @primes << x if is_prime?(x) }
	end

	def is_prime?(num)
		primes.each do |prime|
			return false if num % prime == 0
			return true if prime > Math.sqrt(num).round
		end
	end

	def print_prime_sums
		primes.inject(:+)
	end
end

idk = PrimeCache.new(2000000)
idk.get_primes_upto
p idk.print_prime_sums