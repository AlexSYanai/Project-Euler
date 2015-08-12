defmodule ThousandTriple do
	def find_triple do
		combine_numbers(3,2,1,0)
	end

	def combine_numbers(a,b,c,triple) when c >= 332, do: combine_numbers(a,(b+1),1,triple)
	def combine_numbers(a,b,_,triple) when b >= 499, do: combine_numbers((a+1),2,1,triple)
	def combine_numbers(a,_,_,_) 			when a >= 600, do: IO.puts "Error - Something Went Wrong"

	def	combine_numbers(_,_,_,triple) when triple > 0 do
		IO.puts triple	
	end

	def combine_numbers(a,b,c,triple) when triple <= 0 do
		if pythagorean_triplet?(a,b,c)  do
			triple = Enum.reduce([a,b,c], fn m,n -> m * n end)
		end 

		combine_numbers(a,b,c+1,triple)
	end

	def pythagorean_triplet?(a,b,c) do
		sum? = Enum.reduce([a,b,c], fn m,n -> m + n end) == 1000
		eql? = (b * b) + (c * c) == (a * a)

		sum? and eql?
	end
end

ThousandTriple.find_triple