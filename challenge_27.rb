class PrimeConsecutive
	attr_accessor :negative_prime_array, :all_primes
	attr_reader :limit
	def initialize(limit)
		@limit = limit
		@all_primes = []
	end

	def prime_consecutive_values
		holder_array = []
		prime_product_hash = {}
		for a_prime in all_primes
			for b_prime in all_primes
				prime = 1 unless a_prime == b_prime
				while prime
					calculated_prime = quadratic_function_calculator(a_prime,b_prime,prime)
					if prime?(calculated_prime)
						holder_array << prime
						prime_product_hash[prime] = a_prime * b_prime
						prime += 1
					else
						break
					end
				end
			end
		end
		return prime_product_hash[holder_array.max]
	end

	def sieve_of_eratosthenes(array,upper) #Recycled from challenge 21
    array = (3..upper).step(2).to_a.insert(0,2)
    (4..array.last).map { |n| array.delete_if { |number| number % n == 0 && number > n } }
    array
	end

	def generate_primes
		@all_primes = sieve_of_eratosthenes(all_primes,limit).flat_map { |prime| [prime,-prime] }.sort
	end

	def prime?(number)
		all_primes.include?(number)
	end

	def quadratic_function_calculator(a,b,n)
		(n**2)+(a*n)+b
	end
end

euler = PrimeConsecutive.new(1000)
euler.generate_primes
p euler.prime_consecutive_values
