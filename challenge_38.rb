class PandigitalMultiples
  attr_accessor :product_array,:final_sum,:all_pandigitals
  attr_reader   :number_strings
  def initialize
    @number_strings  = %w(1 2 3 4 5 6 7 8 9)
    @all_pandigitals = []
  end

  def check_numbers
    (9000..9999).each { |n| find_products(n) }
  end

  def find_products(num)
    prime1 = num.to_s
    counter = 2

    while counter < 4
      idk = num*counter
      prime1 += idk.to_s
      all_pandigitals << prime1 if is_pandigital?(prime1)
      counter += 1
    end
  end

  def is_pandigital?(num_array)
    num_array.split("").sort == number_strings
  end
end

euler = PandigitalMultiples.new
euler.check_numbers
p euler.all_pandigitals
