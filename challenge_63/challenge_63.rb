# Easier to solve with pen and paper
class Integer
	def same_digit_length?(x)     # Tests digit count against the exponent 
		(self**x).to_s.length == x
	end
end

exp = 1
num = 1
count = 0

while 9.same_digit_length?(exp)   # Upper bound is 9 => 10**x will always
	unless num == 9 								# have a product 1 digit greater in length
		(num..9).each do |n|
			if n.same_digit_length?(exp)
				count += 1
			else
				num = n if n > num 				# Once a product digit length is less than
			end 												# the exponent it never becomes equal to it
		end 													# Can reset the lower bound if n > num
	else
		count += 1
	end
	exp += 1
end

p count