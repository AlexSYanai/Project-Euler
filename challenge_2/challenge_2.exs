defmodule Fibonacci do
	def find_fib(limit) do
		calc(0, 1, 0, limit)
	end

	def calc(m,n,acc,limit) when n < limit do
		if rem( (m + n),2) == 0, do: acc = acc + m + n
		calc(n, (m + n), acc, limit)
	end

	def calc(_,n,acc,limit) when n >= limit, do: acc
end

IO.puts Fibonacci.find_fib(4_000_000)