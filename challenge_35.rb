require 'pry'
class CircularPrime
  attr_accessor :prime_array, :grouped_primes, :circular_primes
  # attr_reader   :search_range

  def initialize#(finish)
    # @search_range = (11..finish)
    @prime_array = []#(2..1000000).to_a#.insert(0,2)
    @circular_primes = [2,3,5,7,11]
  end

  def find_circular
    split = prime_array.map { |num| num.to_s.split("") }
    for i in 2..6
      temp = split.select { |el| el.length == i }
      until temp == nil || temp.empty?
        idk = temp.pop
        unless idk.include?("2") || idk.include?("5") || idk.include?("0") || idk.include?("6") || idk.include?("4") || idk.include?("8")
          if i == 2 && temp.include?(idk.rotate)
            @circular_primes << [idk.join("").to_i,idk.rotate.join("").to_i]
          elsif i == 3 && temp.include?(idk.rotate) && temp.include?(idk.rotate(2))
            @circular_primes << [idk.join("").to_i,idk.rotate.join("").to_i,idk.rotate(2).join("").to_i]
          elsif i == 4 && temp.include?(idk.rotate) && temp.include?(idk.rotate(2)) && temp.include?(idk.rotate(3))
            @circular_primes << [idk.join("").to_i,idk.rotate.join("").to_i,idk.rotate(2).join("").to_i,idk.rotate(3).join("").to_i]
          elsif i == 5 && temp.include?(idk.rotate) && temp.include?(idk.rotate(2)) && temp.include?(idk.rotate(3)) && temp.include?(idk.rotate(4))
            @circular_primes << [idk.join("").to_i,idk.rotate.join("").to_i,idk.rotate(2).join("").to_i,idk.rotate(3).join("").to_i,idk.rotate(4).join("").to_i]
          elsif i == 6 && temp.include?(idk.rotate) && temp.include?(idk.rotate(2)) && temp.include?(idk.rotate(3)) && temp.include?(idk.rotate(4)) && temp.include?(idk.rotate(5))
            @circular_primes << [idk.join("").to_i,idk.rotate.join("").to_i,idk.rotate(2).join("").to_i,idk.rotate(3).join("").to_i,idk.rotate(4).join("").to_i,idk.rotate(5).join("").to_i]
          else
            next
          end
        end
      end
    end
  end

  def is_circular?(value)

  end

  def sieve_of_eratosthenes
    for i in 0..1000000-2
      prime_array[i] = i+2
    end

    index = 0
    while prime_array[index]**2 <= prime_array.last
      prime = prime_array[index]
      @prime_array = prime_array.select { |x| x == prime || x%prime != 0 }
      index += 1
    end
  end
end

euler = CircularPrime.new#(1000000)
euler.sieve_of_eratosthenes
# euler.group_by_length
euler.find_circular
p euler.circular_primes#.flatten.sort#.length
# grouped_primes.each do |key1,value|
#   temp = value.map { |num| num.to_s.split("") }
#   until temp.empty?
#     idk = temp.pop
#     unless idk.include?("2") || idk.include?("5") || idk.include?("0")
#       if key1 == 2 && temp.include?(idk.rotate)
#         @circular_primes << [idk.join("").to_i,temp[temp.find_index(idk.rotate)].join("").to_i]
#       elsif key1 == 3 && temp.include?(idk.rotate) && temp.include?(idk.rotate(2))
#         @circular_primes << [idk.join("").to_i,temp[temp.find_index(idk.rotate)].join("").to_i,temp[temp.find_index(idk.rotate(2))].join("").to_i]
#       elsif key1 == 4 && temp.include?(idk.rotate) && temp.include?(idk.rotate(2)) && temp.include?(idk.rotate(3))
#         @circular_primes << [idk.join("").to_i,temp[temp.find_index(idk.rotate)].join("").to_i,temp[temp.find_index(idk.rotate(2))].join("").to_i,temp[temp.find_index(idk.rotate(3))].join("").to_i]
#       elsif key1 == 5 && temp.include?(idk.rotate) && temp.include?(idk.rotate(2)) && temp.include?(idk.rotate(3)) && temp.include?(idk.rotate(4))
#         @circular_primes << [idk.join("").to_i,temp[temp.find_index(idk.rotate)].join("").to_i,temp[temp.find_index(idk.rotate(2))].join("").to_i,temp[temp.find_index(idk.rotate(3))].join("").to_i,temp[temp.find_index(idk.rotate(4))].join("").to_i]
#       elsif key1 == 6 && temp.include?(idk.rotate) && temp.include?(idk.rotate(2)) && temp.include?(idk.rotate(3)) && temp.include?(idk.rotate(4)) && temp.include?(idk.rotate(5))
#         @circular_primes << [idk.join("").to_i,temp[temp.find_index(idk.rotate)].join("").to_i,temp[temp.find_index(idk.rotate(2))].join("").to_i,temp[temp.find_index(idk.rotate(3))].join("").to_i,temp[temp.find_index(idk.rotate(4))].join("").to_i,temp[temp.find_index(idk.rotate(5))].join("").to_i]
#       else
#         next
#       end
#     end
#   end
# end
