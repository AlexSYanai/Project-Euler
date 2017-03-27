defmodule Pandigital do
	def find(num,prods) when num > 100  do 
		prods
			|> Enum.uniq()
			|> Enum.reduce(0,fn a,b -> a + b end)
	end

	def find(num,prods) when num <= 100 do 
		start = cond do
			num < 9 ->
				1234
			true ->
				123
		end

		find(num + 1,products(num,prods,start,div(10000,(num - 2))))
	end

	def products(_,prods,start,lim) 	when start > lim do
		prods
	end

	def products(num,prods,start,lim) when start <= lim do
		current = num * start
		convert = Integer.to_string(current) <> Integer.to_string(num) <> Integer.to_string(start)
		prods 	= cond do
			pandigital?(convert) ->
				[current] ++ prods
			true ->
				prods
		end

		products(num,prods,start + 1,lim)
	end

	def pandigital?(n) do
		~w(1 2 3 4 5 6 7 8 9) == n 
			|> String.split("", trim: true) 
			|> Enum.sort()
	end 
end

IO.inspect Pandigital.find(3,[])