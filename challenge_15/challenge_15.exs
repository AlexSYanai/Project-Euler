defmodule Lattice do
	def paths(rows,cols) do
		fact.(rows+cols)/(fact.(rows)*fact.(cols)) 
	end
	
	def fact, do: fn n -> Enum.reduce((1..n), 1, fn x,y -> x * y end) end
end

IO.inspect(Lattice.paths(20,20))