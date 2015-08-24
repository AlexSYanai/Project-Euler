defmodule RomanNumerals do
	def convert(file) do
		case File.read(file) do
		  {:ok, body} 		->
		  	trunc_nums(body)
		  {:error,reason} ->
		  	:file.format_error(reason)
		end
	end

	def trunc_nums(file) do
		file
			|> String.replace(~r/CCCC|XXXX|IIII|LXXXX|DCCCC|VIIII/,"**")
			|> String.length()
			|> diff(String.length(file))
	end

	def diff(replaced,original) do
		original - replaced
	end
end

IO.puts RomanNumerals.convert("challenge_89_romans.txt")