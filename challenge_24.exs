defmodule RC do
	def find(list) do
		a = permute(list)
		Enum.at(a,999999)
			|> Enum.join()
			|> String.to_integer()
	end

  def permute([]), do: [[]]

  def permute(list) do
    for n <- list, m <- permute(list -- [n]), do: [n|m]
  end
end
 
IO.inspect RC.find([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
