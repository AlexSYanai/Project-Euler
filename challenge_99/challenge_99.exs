defmodule Exponents do
	def input(file) do
		case File.read(file) do
		  {:ok, body} 		->
		  	body
		  		|> String.split("\n", trim: true)
		  		|> Stream.map(fn b -> String.split(b,",") end)
		  		|> Stream.map(fn [c,d] -> [String.to_integer(c),String.to_integer(d)] end)
					|> Stream.map(fn n -> Enum.at(n,1) * :math.log(Enum.at(n,0)) end) 
					|> Enum.with_index 
					|> Enum.max_by(fn {y,_} -> y end) 
					|> elem(1) 
					|> + 1 
					|> IO.puts
		  {:error,reason} ->
		  	:file.format_error(reason)
		end
	end
end

Exponents.input("challenge_99_exps.txt")