defmodule Lattice do
	def paths(rows,cols), do: round(fact(rows+cols)/(fact(rows)*fact(cols)))
	def fact(n), do: Enum.reduce((1..n), 1, fn x,y -> x * y end)
end

IO.inspect(Lattice.paths(20,20))