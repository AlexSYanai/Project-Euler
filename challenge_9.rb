def find_thousand_triple
	for k in (3..600) do
		for j in (2..499) do
			for i in (1..332) do
				return [i,j,k].inject(:*) if [i,j,k].inject(:+) == 1000 if i**2 + j**2 == k**2
			end
		end
	end
end

p find_thousand_triple
