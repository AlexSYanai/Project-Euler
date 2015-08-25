def find_largest_digit_sum
	digit_sums = []
	99.downto(90) do |i|
		99.downto(90) do |j|
			digit_sums << (i**j).to_s.split("").map(&:to_i).inject(:+)
		end
	end
	p digit_sums.max
end

find_largest_digit_sum