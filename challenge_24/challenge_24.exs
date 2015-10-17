defmodule Permutation do
  def find(list) do
    permute(list)
     |> Enum.at(999999)
     |> Enum.join()
     |> String.to_integer()
  end

  def permute([]),  do: [[]]
  def permute(list) do
    for n <- list, m <- permute(list -- [n]), do: [n|m]
  end
end

0..9
  |> Enum.to_list()
  |> Permutation.find()
  |> IO.inspect
