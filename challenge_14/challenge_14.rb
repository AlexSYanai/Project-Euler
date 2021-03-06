class Collatz   #Brute force - don't know if it's optimized but it works pretty quickly.
  attr_accessor :longest_sequence,:longest_path_number
  attr_reader   :number_array
  def initialize
    @number_array = (1..1000000).select { |n| n.odd? }
    @longest_sequence = 0
    @longest_path_number = 0
  end

  def find_longest_sequence
    number_array.each do |n|
      holder = n
      i = 0
      until holder <= 1
        holder.odd? ? holder = ((holder*3) + 1) : (holder /= 2)
         i += 1
      end
      if i > longest_sequence
        @longest_path_number = n
        @longest_sequence = i
      end
    end
  end
end

euler = Collatz.new
euler.find_longest_sequence
p euler.longest_path_number
