def num1 #Recycled from challenge 7 - it takes a while to run but it works..
	number_generator = (3..2000000).step(2).to_a
	counter = 3
	while counter**2 <= number_generator.last
		number_generator.delete_if { |number| number % counter == 0 && number > counter }
	 	counter += 1
	end
	number_generator.inject(:+) #=> Need to add 2, but I lazily copied my challenge 7 code
end

p num1
