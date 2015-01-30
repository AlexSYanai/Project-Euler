def num1
	number_generator = (3..110000).step(2).to_a #Proactively getting rid of the evens
	counter = 3
	while counter**2 <= number_generator.last
		number_generator.delete_if { |number| number % counter == 0 && number > counter }
	 	counter += 1
	end
	number_generator.sort[9999]
end

puts num1
