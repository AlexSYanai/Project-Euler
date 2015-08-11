defmodule SquareDiff do
	def idk do
		square = (fn(x) -> x * x end)
		calc_diff(((1..100) 
							  |> Enum.reduce(fn(a,b) -> a + b end) 
							  |> square.()), 
						  ((1..100) 
						  	|> Enum.map(square) 
							  |> Enum.reduce(fn(a,b) -> a + b end)
						 ))
	end

	def calc_diff(b,c) do
		IO.puts (b - c)
	end
end

SquareDiff.idk