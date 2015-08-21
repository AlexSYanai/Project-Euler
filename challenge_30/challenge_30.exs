defmodule DigitPowers do
	def fifth(num,lim,sum) when num > lim do
		sum
	end

	def fifth(num,lim,sum) when num <= lim do
		val = if digit_power?(num), do: num, else: 0
		fifth(num+1,lim,sum+val)
	end

	def digit_power?(n) do
		d = Integer.to_string(n)
			|> String.split("", trim: true)
			|> Enum.map(fn x -> round(:math.pow(String.to_integer(x),5)) end)
			|> Enum.reduce(fn a,b -> a + b end)
		n == d
	end
end

IO.puts DigitPowers.fifth(2,round(:math.pow(9,6)),0)