p (1..100).to_a.reverse.inject(:*).to_s.split("").map(&:to_i)
