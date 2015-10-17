defmodule Mth do
  def p(_, 0), do: 1
  def p(x, 1), do: x
  def p(x, n) when rem(n, 2) == 0, do: (p(x, div(n, 2)))*(p(x, div(n, 2)))
  def p(x, n) when rem(n, 2) != 0, do: x * p(x, n-1)
end

(1..1_000)
  |> Enum.map(fn n -> Mth.p(n,n) end)
  |> Enum.reduce(fn a,b -> a + b end)
  |> Integer.to_string()
  |> String.slice(-10,10)
  |> IO.inspect()
