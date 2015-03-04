class PrimeFinder
  attr_accessor :new_num, :largest_factor, :counter
  def initialize(num)
    @new_num        = num
    @counter        = 2
    @largest_factor = 0
  end

  def finder
    while ((counter**2) <= new_num)
      if (new_num % counter == 0)
        @new_num /= counter
        largest_factor = counter
      else
        @counter += 1
      end
      largest
    end
    new_num
  end

  def largest
    @largest_factor = new_num if new_num > largest_factor
  end
end

euler = PrimeFinder.new(600851475143)
p euler.finder
