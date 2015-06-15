 def count_coins(target)
   coins = [1,2,5,10,20,50,100,200]
   ways = ["1" + "0"*200].map{ |n| n.split("").map(&:to_i) }.flatten
   coins.each { |coin| (coin..target).each { |num|  ways[num] += ways[num-coin] } }
   ways[target]
 end
p count_coins(200)
