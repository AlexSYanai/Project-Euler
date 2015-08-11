defmodule PrimeMultiple do
	def find_multiple do
		remainders([5, 7, 9, 11, 13, 16, 17, 19] |> Enum.reduce(1, fn(a,b) -> a * b end),0)
	end

	def remainders(prime_sum,final) when final > 0 or prime_sum <= 0 do
		IO.puts final
	end

	def remainders(prime_sum,final) when prime_sum > 0 do
		if Enum.all?(1..20,  fn x -> rem(prime_sum,x) == 0 end) do
			final = prime_sum
		end
		remainders(prime_sum-1,final)
	end
end

PrimeMultiple.find_multiple