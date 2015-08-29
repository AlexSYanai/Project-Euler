ones = %{
	1 => "one",
	2 => "two",
	3 => "three",
	4 => "four",
	5 => "five",
	6 => "six",
	7 => "seven",
	8 => "eight",
	9 => "nine",
	10 => "ten",
	11 => "eleven",
	12 => "twelve",
	13 => "thirteen",
	14 => "fourteen",
	15 => "fifteen",
	16 => "sixteen",
	17 => "seventeen",
	18 => "eighteen",
	19 => "nineteen"
}

tens = %{ 
	2 => "twenty",
	3 => "thirty",
	4 => "forty",
	5 => "fifty",
	6 => "sixty",
	7 => "seventy",
	8 => "eighty",
	9 => "ninety"
}

defmodule NumsTo do
	def words(n,_,ones,_) when n < 20 do
		ones[n]
	end

	def words(n,a,ones,tens) when tuple_size(a) == 2 do
		cond do
			Dict.has_key?(ones,elem(a,0)) ->
				ones[n]
			elem(a,0) == "0" ->
				tens[String.to_integer(elem(a,1))]
			true ->
				t = tens[String.to_integer(elem(a,1))]
				o = ones[String.to_integer(elem(a,0))]
				t <> o
		end
	end

	def words(_,a,ones,tens) when tuple_size(a) > 2 do
		cond do
			(elem(a,1) <> elem(a,0)) == "00" ->
				ones[String.to_integer(elem(a,2))] <> "hundred"
			Dict.has_key?(ones,String.to_integer((elem(a,1) <> elem(a,0)))) ->
				o = ones[String.to_integer(elem(a,2))]
				h = ones[String.to_integer((elem(a,1) <> elem(a,0)))]  
				o <> "hundredand" <> h 
			Dict.has_key?(tens,String.to_integer(elem(a,1))) && elem(a,0) == "0" ->
				o = ones[String.to_integer(elem(a,2))]
				t = tens[String.to_integer(elem(a,1))] 
				o <> "hundredand" <> t
			true ->
				h = ones[String.to_integer(elem(a,2))]
				t = tens[String.to_integer(elem(a,1))]
				o = ones[String.to_integer(elem(a,0))]
				h <> "hundredand" <> t <> o
		end
	end

	def str_rev(num) do
		num 
		  |> Integer.to_string() 
		  |> String.split("", trim: true) 
		  |> Enum.reverse()
		  |> List.to_tuple() 
	end
end

c = for n <- (1..999), into: "", do: NumsTo.words(n,NumsTo.str_rev(n),ones,tens)
c = c <> "onethousand"
IO.puts(String.length(c))