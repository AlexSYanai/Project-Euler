defmodule Factorial do 
	def fact(n), do: find(n,1)
	def find(n,acc) when n > 0, do: find(n-1, acc*n)
	def find(n,acc) when n == 0, do: acc
end

map_list_to_i = fn a -> Enum.map(a, fn b -> String.to_integer(b) end) end

100 
	|> Factorial.fact() 
	|> Integer.to_string() 
	|> String.split("", trim: true) 
	|> map_list_to_i.() 
	|> Enum.reduce(fn a,b -> a + b end) 
	|> IO.inspect