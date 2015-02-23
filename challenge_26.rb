array_of_remainders = (0..1000).map do |denominator|
  (1..denominator).find(lambda{0}) do |divisor| #.find(lambda{x} <- searches for condition and
     (10**divisor % denominator) == 1           #returns x if false or the found element if true
  end
end

p array_of_remainders.each_with_index.max.last
