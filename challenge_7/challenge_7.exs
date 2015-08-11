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

IO.inspect Enum.at(SieveofEratosthenes.init_sieve(110_000),10_000)