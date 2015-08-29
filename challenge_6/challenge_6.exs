defmodule SquareDiff do
	def diff do
		calc_diff(
			((1..100) 
				  |> Enum.reduce(fn(a,b) -> a + b end) 
				  |> square()), 
			  ((1..100) 
			  	|> Enum.map(&(square(&1))) 
				  |> Enum.reduce(fn(a,b) -> a + b end)
			 ))
		|> IO.inspect
	end

	def square(x), 			do: x*x
	def calc_diff(b,c), do: (b - c)
end

SquareDiff.diff