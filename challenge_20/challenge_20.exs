defmodule Factorial do 
  def fact(n), do: find(n,1)
  def find(n,acc) when n > 0,  do: find(n-1, acc*n)
  def find(n,acc) when n == 0, do: acc
end

100
  |> Factorial.fact()
  |> Integer.to_string()
  |> String.split("", trim: true)
  |> Enum.map(fn a -> String.to_integer(a) end)
  |> Enum.reduce(fn a,b -> a + b end)
  |> IO.inspect
