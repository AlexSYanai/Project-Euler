class Integer
  def square
    Math.sqrt(self).floor
  end

  def is_square?
    (self.square)**2 == self
  end
end

class Diophantine
  attr_accessor :diophantine_nums,:largest,:large_x
  attr_reader   :final
  def initialize(final)
    @final = final
    @largest = 0
    @large_x = 0
  end

  def generate_diophantine_nums
    @diophantine_nums = (2..final).reject(&:is_square?)
  end

  def find_diophantine
    diophantine_nums.each do |d|
      a,b,c = 0,1,d.square
      x1,x,y1,y = 1,c,0,1

      until diophantine(d,x,y)
        a,b,c = assign_coeefficient(a,b,c,d)
        x2,x1,y2,y1 = x1,x,y1,y

        x = c*x1 + x2
        y = c*y1 + y2
      end
      set_largest(x,d) if x > large_x
    end
  end

  def diophantine(d,x,y)
    ((x**2) - (d*y**2)) == 1
  end

  def set_largest(x,d)
    @large_x = x
    @largest = d
  end

  def assign_coeefficient(a,b,c,d)
    a = ((b*c) - a)
    b = ((d-(a**2))/b)
    c = ((d.square+a)/b)
    [a,b,c]
  end
end

euler = Diophantine.new(1000)
euler.generate_diophantine_nums
euler.find_diophantine
p euler.largest
