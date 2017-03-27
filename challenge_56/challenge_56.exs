defmodule Mth do
  def p(_, 0), do: 1
  def p(x, 1), do: x
  def p(x, n) when rem(n, 2) == 0, do: (p(x, div(n, 2)))*(p(x, div(n, 2)))
  def p(x, n) when rem(n, 2) != 0, do: x * p(x, n-1)
end

defmodule DigitSum do
  def largest(i,_,largest) when i < 90, do: largest
  def largest(i,j,largest) when j < 90  do
    largest(i-1,99,largest)
  end

  def largest(i,j,largest) when j >= 90 do
    sum = sum_digits(i,j)
    if sum > largest, do: largest = sum
    largest(i,j-1,largest)
  end

  def sum_digits(i,j) do
    Mth.p(i,j)
      |> Integer.to_string()
      |> String.split("",trim: true)
      |> Enum.map(fn n -> String.to_integer(n) end)
      |> Enum.reduce(0, fn a,b -> a + b end)
  end
end

IO.inspect DigitSum.largest(99,99,0)
