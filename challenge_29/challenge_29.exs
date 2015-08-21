defmodule Doubles do
	def find(a,b,lim,doubles) when a > lim do
		IO.inspect length(doubles)
	end

	def find(a,b,lim,doubles) when b > lim do
		find(a+1,2,lim,doubles)
	end

	def find(a,b,lim,doubles) when b <= lim do
		num = round(:math.pow(a,b))
		unless Enum.member?(doubles,num), do: doubles = [num] ++ doubles
		find(a,b+1,lim,doubles)
	end
end

Doubles.find(2,2,100,[])