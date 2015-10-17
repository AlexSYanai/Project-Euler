 def count_coins(target)
   ways = Array.new(target) { 0 }.unshift(1)
   [1,2,5,10,20,50,100,200].map { |coin| (coin..target).map { |num| ways[num] += ways[num-coin] } }.last.last
 end
 
p count_coins(200)
