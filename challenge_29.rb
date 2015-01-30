doubled_array = []
for a_number in (2..100)
	for b_number in (2..100)
		doubled_array << (a_number**b_number) unless doubled_array.include?(a_number**b_number)
	end
end
p doubled_array.length