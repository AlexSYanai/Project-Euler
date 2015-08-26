use Bitwise
defmodule Exponents do
	def input(file,cipher) do
		case File.read(file) do
		  {:ok, body} 		->
		  	body
		  		|> String.replace("\n","") 
		  		|> String.split(",", trim: true) 
		  		|> Enum.map(fn n -> String.to_integer(n) end)
		  		|> create_key(cipher)
					|> format_secret()
					|> IO.puts
		  {:error,reason} ->
		  	:file.format_error(reason)
		end
	end

	def create_key(code,cipher) do
		cipher_key = List.duplicate(cipher,(div(length(code),3))) |> List.flatten()
		unless rem(length(code),3) == 0 do
			if rem(length(code),3) == 1 do
				cipher_key = cipher_key ++ [Enum.at(cipher_key,0)]
			else
				cipher_key = cipher_key ++ [Enum.at(cipher_key,0),Enum.at(cipher_key,1)]
			end
		end
		decrypt(code,cipher_key)
	end

	def decrypt(code,cipher_key) do
		IO.inspect cipher_key
		Enum.zip(code,cipher_key)
			|> Enum.map_reduce(0,fn {b,c},d -> {(b ^^^ String.to_integer(c)), ((b ^^^ String.to_integer(c)) + d)} end)
	end

	def format_secret({message,sum}) do
		"MESSAGE \n=======\n#{message}\n=======\nSum of Original ASCII Values: #{sum }"
	end
end

Exponents.input("challenge_59_cipher.txt",["103", "111", "100"])