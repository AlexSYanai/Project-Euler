def pal
	num_array = []
	(900..999).each do |n|
		(900..999).each do |m|
			a = m * n
			b = a.to_s.split(//)
			num_array << a if b[0] == b[5] && b[1] == b[4] && b[2] == b[3]
		end
	end
	num_array.sort.last
end

p pal
