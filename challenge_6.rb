(1..100).map {|n| n**2}.inject(:+)
(1..100).inject(:+)**2
p ((1..100).inject(:+)**2) - (1..100).map {|n| n**2}.inject(:+)
