defmodule Mth do
  def p(x,n) do # VERY inefficient - compile error with :math.pow => will refactor
    Stream.cycle([x]) |> Enum.take(n) |> Enum.reduce(fn a,b -> a * b end)
  end
end

defmodule ReciprocalCycles do
  def find do
    a = for n <- (1..1000), do: Enum.find(1..n, 0, fn m -> recurring?(n,m) end)
    Enum.with_index(a)
      |> Enum.max_by(fn {x,_} -> x end)
      |> get_tup_val()
      |> IO.inspect
  end

  def recurring?(n,m),    do: (rem(Mth.p(10,m),n) == 1)
  def get_tup_val({_,y}), do: y + 1
end

ReciprocalCycles.find
