defmodule Permutation do
	def multiples(num,lim,final) when num > lim or final == true do
		IO.inspect num-1
	end

	def multiples(num,lim,_) when num <= lim  do
		multiples(num+1,lim,perm(2,num,[]))
	end

	def perm(current,_,bools) when current > 6 do
		Enum.all?(bools,fn x -> x == true end)
	end

	def perm(current,num,bools) when current <= 6 do
		perm(current+1,num,[permutation?(convert(num),current,num)] ++ bools)
	end

	def permutation?(a,b,c), do: a === convert(b*c)
	
	def convert(n) do
		n 
			|> Integer.to_string() 
			|> String.split("", trim: true) 
			|> Enum.sort()
	end
end

Permutation.multiples(1,1_000_000,false)