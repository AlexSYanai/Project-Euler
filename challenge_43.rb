class PandigitalDivisibility # Methods and arrays split up for debugging purposes
  attr_accessor :permutations,:all_pandigitals
  attr_reader   :number_array
  def initialize
    @number_array    = %w(0 1 2 3 4 5 6 7 8 9)
    @all_pandigitals = []
  end

  def digit_arrays
    @seventeen_array = ("10".."999").select { |n| n if n.to_i % 17 == 0 && n.split("").uniq == n.split("") }.map { |m| m.length == 2 ? "0" + m : m } #d8-d10
    @thirteen_array  = ("10".."999").select { |n| n if n.to_i % 13 == 0 && n.split("").uniq == n.split("") }.map { |m| m.length == 2 ? "0" + m : m } #d7-d9
    @eleven_array    = ("10".."999").select { |n| n if n.to_i % 11 == 0 && n.split("").uniq == n.split("") }.map { |m| m.length == 2 ? "0" + m : m } #d6-d8
    @seven_array     = ("10".."999").select { |n| n if n.to_i % 7  == 0 && n.split("").uniq == n.split("") }.map { |m| m.length == 2 ? "0" + m : m } #d5-d7
    @five_array      = ("10".."999").select { |n| n if n.to_i % 5  == 0 && n.split("").uniq == n.split("") }.map { |m| m.length == 2 ? "0" + m : m } #d4-d6
    @three_array     = ("10".."999").select { |n| n if n.to_i % 3  == 0 && n.split("").uniq == n.split("") }.map { |m| m.length == 2 ? "0" + m : m } #d3-d5
    @two_array       = ("10".."999").select { |n| n if n.to_i.even?     && n.split("").uniq == n.split("") }.map { |m| m.length == 2 ? "0" + m : m } #d2-d4
  end

  def select_permutations
    @temp = []
    @seventeen_array.each do |a|
      @thirteen_array.each do |b|
        @eleven_array.each do |c|
          @temp << c[0] + b[0] + a if a[-3..-2] == b[-2..-1] && b[-3..-2] == c[-2..-1] && c[0] == "5" # Since last digit of five_array must be 5
        end
      end
      @temp.select! { |n| n.split("") == n.split("").uniq }
    end
    @temp1 = []
    @seven_array.each do |a|
      @five_array.each do |b|
        @three_array.each do |c|
          @temp1 << c[0] + b[0] + a if a[-3..-2] == b[-2..-1] && b[-3..-2] == c[-2..-1] && b[0].to_i.even? #fourth digit needs to be even 
        end
      end
      @temp1.select! { |n| n.split("") == n.split("").uniq }
    end
    @temp2 = []
    @temp.each do |a|
      @temp1.each do |b|
        @temp2 << b[0..-3] + a if a[0..1] == b[-2..-1] && ( b[0..-3] + a).split("") == ( b[0..-3] + a).split("").uniq
      end
    end
    p leftover = @temp2.sort!.map { |n| @number_array - n.split("") }
    @temp2.each_with_index { |n,i| all_pandigitals << [(leftover[i].join("") + n).to_i,(leftover[i].reverse.join("") + n).to_i]}
    p all_pandigitals.flatten.inject(:+)
  end
end

euler = PandigitalDivisibility.new
euler.digit_arrays
euler.select_permutations
