class Pandigital
  attr_accessor :product_array, :final_sum
  attr_reader   :number_strings
  def initialize
    @number_strings = %w(1 2 3 4 5 6 7 8 9)
    @product_array  = []
  end

  def find_products
    (2..100).each do |x|
      start = (x<9) ? 1234 : 123
      (start..(10000/x-2)).each do |y|
        current_product = x*y
        converted = current_product.to_s + x.to_s + y.to_s
        product_array << current_product unless product_array.include?(current_product) if is_pandigital?(converted)
      end
    end
    @final_sum = product_array.inject(:+)
  end

  private
  def is_pandigital?(num)
    num.split("").sort == number_strings
  end
end

euler = Pandigital.new
euler.find_products
p euler.final_sum
