class DoubleBasePalindrome
  attr_accessor :ten_array, :two_array

  def initialize(range)
    @range     = range
    @ten_array = []
    @two_array = []
  end

  def find_ten_palindrome
    (1..@range).each { |num| ten_array << num.to_s if is_palindrome?(num.to_s) }
  end

  def find_two_palindrome
    ten_array.each { |num| two_array << to_binary(num) if is_palindrome?(to_binary(num)) }
  end

  def double_base_palindrome
    two_array.map { |palindrome| palindrome.to_i(2) }.inject(:+)
  end

  private
  def to_binary(number)
    number.to_i.to_s(2)
  end

  def is_palindrome?(number)
    number == number.split("").reverse.join("")
  end
end

euler = DoubleBasePalindrome.new(1000000)
euler.find_ten_palindrome
euler.find_two_palindrome
p euler.double_base_palindrome
