dec_hash = {1=>0,10=>0,100=>0,1000=>0,10000=>0,100000=>0,1000000=>0,}
i = 0
(0..1000000).map { |n| n.to_s }.join("").each_char do |s|
  dec_hash[i] = s if dec_hash.has_key?(i)
  i += 1
end
p dec_hash.values.map { |n| n.to_i }.inject(:*)
