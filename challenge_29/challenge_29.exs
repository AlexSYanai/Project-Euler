defmodule Doubles do
  def find(a,_,lim,doubles) when a > lim do
    length(doubles)
  end

  def find(a,b,lim,doubles) when b > lim do
    find(a + 1, 2, lim, doubles)
  end

  def find(a,b,lim,doubles) when b <= lim do
    num     = round(:math.pow(a,b))
    doubles = cond do 
      Enum.member?(doubles, num) ->
        doubles
      true ->
        [num] ++ doubles
    end

    find(a, b + 1, lim, doubles)
  end
end

IO.puts Doubles.find(2,2,100,[])