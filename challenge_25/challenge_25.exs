defmodule Fibonacci do
	def find(_,_,count,len) when len >= 1000, do: count

	def find(num1,num2,count,len) when len < 1000 do
		find(num2,(num1 + num2),count+1,String.length(Integer.to_string(num2)))
	end
end

IO.inspect Fibonacci.find(0,1,0,0)