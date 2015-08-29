defmodule Mth do
  def p(_, 0), do: 1
  def p(x, 1), do: x
  def p(x, n) when rem(n, 2) == 0, do: (p(x, div(n, 2)))*(p(x, div(n, 2)))
  def p(x, n) when rem(n, 2) != 0, do: x * p(x, n-1)
end

Mth.p(2,1_000) 
	|> Integer.to_string 
	|> String.split("", trim: true) 
	|> Stream.map(&(String.to_integer(&1))) 
	|> Enum.reduce(fn y,z -> y + z end)
	|> IO.inspect