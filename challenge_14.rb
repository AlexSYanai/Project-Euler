class Collatz 	#Brute force - don't know if it's optimized but it works pretty quickly.
	attr_accessor :longest_sequence, :number_array, :longest_path_number
	def initialize
		@number_array = (1..1000000).select{|n| n.odd?}
		@longest_sequence = 0
		@longest_path_number = 0
	end

	def find
		for n in number_array
			holder = n
			counter = 0
			until holder <= 1
				if holder.odd?
					holder = (holder*3) + 1
				else
					holder /= 2
				end
				 counter += 1
			end
			if counter > longest_sequence
				@longest_path_number = n
				@longest_sequence = counter
			end
		end
	end
end

euler = Collatz.new
euler.find
p euler.longest_sequence
p euler.longest_path_number
