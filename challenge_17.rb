def in_words  					#Copied, with a few minor changes, from my solution to a 
	challenge_range = (1..999)	#DBC Phase 0 problem.
	ones = {1 => "one",
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
		19 => "nineteen"}

	tens = { 2 => "twenty",
		3 => "thirty",
		4 => "forty",
		5 => "fifty",
		6 => "sixty",
		7 => "seventy",
		8 => "eighty",
		9 => "ninety"}

	word_string = ""
	for n in challenge_range
		a = n.to_s.split(//).reverse
		if n < 20
			word_string += ones[n]
		elsif a.length == 2
			case 
			when ones.has_key?(a[0]) then word_string += ones[n] 
			when a[0].to_i == 0 then word_string += tens[a[1].to_i]
			else word_string += tens[a[1].to_i] + ones[a[0].to_i]
			end
		else
			case
			when (a[1] + a[0]).to_i == 0 then word_string += ones[a[2].to_i] + "hundred"
			when ones.has_key?((a[1] + a[0]).to_i) then word_string += ones[a[2].to_i] + "hundred" + "and" + ones[(a[1] + a[0]).to_i]
			when tens.has_key?(a[1].to_i) && a[0].to_i == 0 then word_string += ones[a[2].to_i] + "hundred" + "and" + tens[a[1].to_i]
			else word_string += ones[a[2].to_i] + "hundred" + "and" + tens[a[1].to_i] + ones[a[0].to_i]
			end
		end
	end
	p final_word_string = word_string + "onethousand"
	final_word_string.length
end

p in_words