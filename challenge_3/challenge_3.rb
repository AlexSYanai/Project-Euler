class FindPrime
  attr_accessor :counter
  attr_reader   :new_num,:largest_factor
  def initialize(num)
    @new_num        = num
    @counter        = 2
    @largest_factor = 0
  end

  def finder
    while (counter**2) <= new_num
      if new_num % counter == 0
        @new_num /= counter
        @largest_factor = counter
      else
        @counter += 1
      end
      largest
    end
  end

  def largest
    @largest_factor = new_num if new_num > largest_factor
  end
end

euler = FindPrime.new(600851475143)
euler.finder
p euler.largest_factor
