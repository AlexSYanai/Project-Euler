defmodule Score do
	def names(file) do
		case File.read(file) do
		  {:ok, body} 		->
		  	all(body)
		  {:error,reason} ->
		  	:file.format_error(reason)
		end
	end

	def all(body) do
		body	
			|> String.replace(~r/\W+/, ",")
			|> String.split(",", trim: true)
			|> Enum.map(fn x -> String.to_char_list(x) end) 
			|> Enum.sort()
			|> count(0,1)
	end

	def count(name,total,_) when length(name) == 0 do
		total
	end

	def count([name|names],total,i) when length(names) >= 0 do
		count(names,(total + char_prod(name,i)),i+1)
	end

	def char_prod(char_list,m), do: char_sums(char_list) * m

	def char_sums(char_list) do
		Enum.map(char_list, fn y -> y - 64 end) 
			|> Enum.reduce(fn b,c -> b + c end)
	end
end

IO.inspect Score.names("challenge_22_names.txt")