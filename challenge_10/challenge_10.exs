defmodule SieveofEratosthenes do
	def init_sieve(lim) do
		find_primes(2,lim,(2..lim))
	end

	def find_primes(counter,limit,nums) when (counter * counter) > limit do
		nums
	end

	def find_primes(counter,limit,nums) when (counter * counter) <= limit do
		nums = nums |> Enum.reject(fn x -> rem(x,counter) == 0 and x > counter end)
		find_primes(counter+1,limit,nums)
	end
end

IO.inspect Enum.reduce(SieveofEratosthenes.init_sieve(2_000_000), fn x,y -> x + y end)