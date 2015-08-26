def count_summations(target)
	ways = Array.new(target) { 0 }.unshift(1)
	(1...target).flat_map { |n| (n..target).map { |m| ways[m] += ways[m-n] } }.last
end

p count_summations(100) 