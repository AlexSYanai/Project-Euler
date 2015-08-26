require Integer
defmodule SieveofEratosthenes do
	def init_sieve(lim) do
		find_primes(2,lim,(2..lim))
	end

	def find_primes(counter,limit,nums) when (counter * counter) > limit do
		nums
	end

	def find_primes(counter,limit,nums) when (counter * counter) <= limit do
		find_primes(counter+1,limit,Enum.reject(nums,fn x -> rem(x,counter) == 0 and x > counter end))
	end
end

defmodule Goldbach do # Trying out a more broken up formatting
	def find(lim,primes) do
		sums = get_sums(lim,primes)
		(2..lim) 
			|> Enum.filter(
				fn x -> Integer.is_odd(x) and !Enum.member?(primes,x)
			end) 
			|> Enum.filter(
				fn t -> !Enum.member?(sums,t)
			end) 
			|> List.first()
			|> IO.inspect
	end

	def get_sums(_,primes) do
		primes
			|> Enum.map(
				fn i   	 -> Enum.map(
					Enum.map((0..100), 
						fn y -> 2*round(:math.pow(y,2)) 
					end) ,
						fn j -> i + j 
					end)
				end) 
			|> List.flatten()
	end
end

Goldbach.find(10_000,SieveofEratosthenes.init_sieve(10_000))
