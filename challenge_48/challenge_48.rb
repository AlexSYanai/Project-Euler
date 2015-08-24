p (1..1000).map { |n| (n**n) }.inject(:+).to_s[-10..-1]
