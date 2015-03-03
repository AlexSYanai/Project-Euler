class TrianglePentagonHexagon
  attr_accessor :final
  def initialize
    @final = 0
  end

  def find_pentagonal # All hexagonal are triagonal
    counter = 144
    until final > 0
      hex = generate_hexagonal(counter)
      @final = hex if is_pentagonal?(hex)
      counter += 1
    end
  end

  def generate_hexagonal(num)
    num*((2 * num) - 1)
  end

  def is_pentagonal?(num) # Inverse of final function
    ((Math.sqrt((24 * num) + 1) + 1) % 6) == 0
  end
end

euler = TrianglePentagonHexagon.new
euler.find_pentagonal
p euler.final
