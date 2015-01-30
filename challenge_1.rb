puts (0...1000).select { |num| num % 3 == 0 || num % 5 == 0 }.inject(:+)
