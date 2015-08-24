class PandigitalMultiples
  attr_accessor :all_pandigitals
  attr_reader   :number_strings
  def initialize
    @number_strings  = %w(1 2 3 4 5 6 7 8 9)
    @all_pandigitals = []
  end

  def check_numbers
    (9000..9999).each { |n| find_products(n) }
  end

  def max_pandigital
    all_pandigitals.max.to_i
  end

  private
  def find_products(num)
    pan = num.to_s
    (2..4).each do |n|
      pan += (num*n).to_s
      all_pandigitals << pan if is_pandigital?(pan)
    end
  end

  def is_pandigital?(num_array)
    num_array.split("").sort == number_strings
  end
end

euler = PandigitalMultiples.new
euler.check_numbers
p euler.max_pandigital
