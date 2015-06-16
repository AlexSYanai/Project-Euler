class Integer
  def is_pentagonal? # Inverse of pentagonal function
    ((Math.sqrt((24 * self) + 1) + 1) % 6) == 0
  end

  def generate_pentagonal
    (self*((self*3)-1)/2)
  end
end

class Pentagonal
  attr_accessor :pentagonal
  def initialize
    @pentagonal = 0
  end

  def find_pentagonal
    i = 2
    until pentagonal > 0
      a = i.generate_pentagonal
      (i-1).downto(1) do |j|
        b = j.generate_pentagonal
        @pentagonal = (a-b) if both_pentagonl?(a,b)
      end
      i += 1
    end
  end

  def both_pentagonl?(a,b)
    (a-b).is_pentagonal? && (a+b).is_pentagonal?
  end
end

euler = Pentagonal.new
euler.find_pentagonal
p euler.pentagonal
