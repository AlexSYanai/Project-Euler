defmodule Convergent do
	def converge(num,_,count,lim) when count > lim do
		num
			|> Integer.to_string()
			|> String.split("", trim: true)
			|> Enum.map(fn x -> String.to_integer(x) end) 
			|> Enum.reduce(fn a,b -> a + b end) 
			|> IO.puts
	end

	def converge(num,den,count,lim) when count <= lim do
		[temp,den] = [den,num]
		if rem(count,3) == 0, do: con = 2*(div(count,3)), else: con = 1
		converge(((con*den)+temp),den,count+1,lim)
	end
end

Convergent.converge(2,1,2,100)