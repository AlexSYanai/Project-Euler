defmodule PrimeFactor do
	def find_prime(limit) do
		factor(2, 0, limit)
	end

	def factor(counter, largest, limit) when (counter*counter) < limit do
		if rem(limit,counter) == 0 do
			limit = round(limit/counter)
			largest = counter
		else
			counter = counter + 1
		end
		factor(counter, largest, limit)
	end

	def factor(counter, largest, limit) when (counter*counter) >= limit do
		if limit > largest, do: largest = limit
		largest
	end
end

IO.puts PrimeFactor.find_prime(600_851_475_143)