defmodule Collatz do
  def find_longest(i,n) when n <= 1, do: i

  def find_longest(i,n) when n > 1 do
    if rem(n,2) != 0, do: n = ((n*3)+1), else: n =  div(n,2)
    find_longest(i+1,n)
  end
end

(1..1_000_000)
  |> Stream.filter(fn x -> rem(x,2) != 0 end)
  |> Stream.map(fn a -> {a,Collatz.find_longest(0,a)} end)
  |> Enum.max_by(fn x -> elem(x,1) end)
  |> IO.inspect()
