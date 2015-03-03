class PandigitalDivisibility # Quick refactor of initial solution - Far faster than using .permutation
  attr_accessor :permutations,:all_pandigitals,:sub_strings
  attr_reader   :number_array,:prime_divisors
  def initialize
    @number_array    = %w(0 1 2 3 4 5 6 7 8 9)
    @prime_divisors  = [17,13,11,7,5,3]
    @all_pandigitals = []
    @sub_strings     = { first: [], second: [], third: [] }
  end

  def digit_arrays # Ads arrays of substrings with keys of primes to substring hash
    prime_divisors.each do |key,value|
      sub_strings[key] = ("10".."999").select { |n| n if n.to_i % key == 0 && n.split("").uniq == n.split("") }.map { |m| m.length == 2 ? "0" + m : m }
    end
  end

  def select_permutations # 6th digit has to be 5, 4th divisible by 2
    sub_strings[17].each { |a| sub_strings[13].each { |b| sub_strings[11].each { |c|sub_strings[:first] << c[0] + b[0] + a if check_sub_string(a,b,c) && c[0] == "5" } } }
    sub_strings[7].each  { |a| sub_strings[5].each { |b| sub_strings[3].each { |c| sub_strings[:second] << c[0] + b[0] + a if check_sub_string(a,b,c) && b[0].to_i.even? } } }
    compare_sub_strings
  end

  def check_sub_string(i,j,k) #Method to check overlapping 3-length substrings
     i[-3..-2] == j[-2..-1] && j[-3..-2] == k[-2..-1]
  end

  def validate_sub_strings # Removes substrings with repeat digits
    sub_strings[:first].select!  { |n| n.split("") == n.split("").uniq }
    sub_strings[:second].select! { |n| n.split("") == n.split("").uniq }
  end

  def compare_sub_strings # Splits and compares last 8 digits then concatenates => large performance increase
    sub_strings[:first].each do |a|
      sub_strings[:second].each { |b| sub_strings[:third] << b[0..-3] + a if a[0..1] == b[-2..-1] && (b[0..-3] + a).split("") == (b[0..-3] + a).split("").uniq }
    end
  end

  def find_pandigitals # Finds first 2 digits by process of elimination and applies their permutations to each remaining 8-digit substring
    leftover = sub_strings[:third].sort!.map { |n| number_array - n.split("") }
    sub_strings[:third].each_with_index { |n,i| all_pandigitals << [(leftover[i].join("") + n).to_i,(leftover[i].reverse.join("") + n).to_i]}
  end
end

euler = PandigitalDivisibility.new
euler.digit_arrays
euler.select_permutations
euler.validate_sub_strings
euler.find_pandigitals
p euler.all_pandigitals.flatten.inject(:+)







  # def select_permutations
  #   @temp = []
  #   @sub_strings[17].each do |a|
  #     @sub_strings[13].each do |b|
  #       @sub_strings[11].each do |c|
  #         @temp << c[0] + b[0] + a if check_sub_string.call(a,b,c) && c[0] == "5" # Since last digit of sub_strings[] must be 5
  #       end
  #     end
  #     @temp.select! { |n| n.split("") == n.split("").uniq }
  #   end
  #   @temp1 = []
  #   @sub_strings[7].each do |a|
  #     @sub_strings[5].each do |b|
  #       @sub_strings[3].each do |c|
  #         @temp1 << c[0] + b[0] + a if a[-3..-2] == b[-2..-1] && b[-3..-2] == c[-2..-1] && b[0].to_i.even? #fourth digit needs to be even
  #       end
  #     end
  #     @temp1.select! { |n| n.split("") == n.split("").uniq }
  #   end
  #   sub_strings[:third] = []
  #   @temp.each do |a|
  #     @temp1.each do |b|
  #       sub_strings[:third] << b[0..-3] + a if a[0..1] == b[-2..-1] && ( b[0..-3] + a).split("") == ( b[0..-3] + a).split("").uniq
  #     end
  #   end
  #   leftover = sub_strings[:third].sort!.map { |n| @number_array - n.split("") }
  #   sub_strings[:third].each_with_index { |n,i| all_pandigitals << [(leftover[i].join("") + n).to_i,(leftover[i].reverse.join("") + n).to_i]}
  #   p all_pandigitals.flatten.inject(:+)
  # end
