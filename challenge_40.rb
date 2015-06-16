dec_hash = {1=>0,10=>0,100=>0,1000=>0,10000=>0,100000=>0,1000000=>0,}
(0..1000000).map(&:to_s).join("").chars.each_with_index { |char,i| dec_hash[i] = char if dec_hash.has_key?(i) }
p dec_hash.values.map(&:to_i).inject(:*)
