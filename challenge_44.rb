class Pentagonal
  attr_accessor :pentagonal
  def initialize
    @pentagonal = 0
  end

  def find_pentagonal
    i = 2
    until pentagonal > 0
      a = generate_pentagonal(i)
      j = i - 1
      while j > 0
        b = generate_pentagonal(j)
        @pentagonal = (a-b) if is_pentagonal?(a-b) && is_pentagonal?(a+b)
        j -= 1
      end
      i += 1
    end
  end

  def generate_pentagonal(num)
    (num*((num*3)-1)/2)
  end

  def is_pentagonal?(num) # Inverse of pentagonal function
    ((Math.sqrt((24 * num) + 1) + 1) % 6) == 0
  end
end

euler = Pentagonal.new
euler.find_pentagonal
p euler.pentagonal
