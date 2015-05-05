require 'benchmark'
class TriangleNumbers
  attr_accessor :prime_array,:triangle_num,:divs,:num_divs,:current_prime
  attr_reader   :target_divs
  def initialize(target_divs)
    @target_divs   = target_divs
    @prime_array   = []
    @divs          = []
    @triangle_num  = 1
    @num_divs      = 0
    @current_prime = 3
  end

  def find_triangle_numbers
    while num_divs <= target_divs
      @triangle_num = (current_prime*(current_prime+1)/2)
      test_triangle(triangle_num)
      @num_divs = divs.map { |i| i += 1 }.inject(:*)
      @current_prime += 1
    end
  end

  def test_triangle(tri_num)
    count = 0
    factors = []
    @divs = []
    i = 0
    while tri_num > 1
      if (tri_num % @prime_array[i]) == 0
        factors << @prime_array[i] unless factors.include?(@prime_array[i])
        count += 1
        tri_num /= @prime_array[i]
        divs << count if tri_num == 1
      else
        count > 0 ? divs << count : nil
        count = 0
        i += 1
      end
    end
  end

  def sieve_of_eratosthenes
    (0..(target_divs*25)).each { |i| prime_array[i] = i+2 }
    index = 0
    while prime_array[index]**2 <= prime_array.last
      @prime_array = prime_array.select { |x| x == prime_array[index] || x % prime_array[index] != 0 }
      index += 1
    end
  end
end
# Benchmark.bm do |a|
#   a.report {
    euler = TriangleNumbers.new(500)
    euler.sieve_of_eratosthenes
    euler.find_triangle_numbers
    p euler.triangle_num
#   }
# end

# Old
# user     system      total        real
# 1.420000   0.000000   1.420000 (  1.421089)
# New
# user     system      total        real
# 0.370000   0.000000   0.370000 (  0.362893)
