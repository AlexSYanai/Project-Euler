# Upper bound = 9**6? # => works. Reducing this doesn't lead to a huge increase in efficiency
# (for the correct answer, that is)

def IntegerProcessor(number)
	sum = number.to_s.split("").map { |digit| (digit.to_i)**5 }.inject(:+) == number
end

p (2..(9**6)).map { |number| IntegerProcessor(number) ? number : 0 }.inject(:+)
