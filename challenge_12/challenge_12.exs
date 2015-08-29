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

defmodule Triangle do
	def factor(tri,divs,_,_,_,_) when tri <= 1 do
		Enum.reduce(Stream.map(divs, fn x -> x + 1 end), fn a,b -> a * b end)
	end

	def factor(tri,divs,facts,p_a,i,count) when tri > 1 do
		prime = Enum.at(p_a,i)
		if rem(tri,prime) == 0 do
			unless Enum.member?(facts,prime), do: facts = [prime] ++ facts
			count = count + 1
			tri = div(tri,prime)
			if tri == 1, 	do: divs = divs ++ [count]
		else
			if count > 0, do: divs = divs ++ [count]
			count = 0
			i = i + 1
		end
		factor(tri,divs,facts,p_a,i,count)
	end
end

calc_tri_num = fn n -> div((n * (n+1)),2) end
primes = SieveofEratosthenes.init_sieve(12500)

for n <- (3..12500), Triangle.factor(calc_tri_num.(n),[],[],primes,0,0) >= 500, do: {:halt,IO.inspect(calc_tri_num.(n))}