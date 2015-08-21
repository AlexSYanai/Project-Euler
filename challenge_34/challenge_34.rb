class DigitFactorials
  attr_accessor :fact_sum
  attr_reader   :factorials
  def initialize
    @factorials = [1]
    @fact_sum   = 0
  end

  def find_factorials
    (1..9).each { |n| factorials << n*factorials.last }
  end

  def find_digit_factorial # Incidentally, there are only 2. Cool!
    (3..(factorials.last)).each { |num| @fact_sum += num if is_digit_factorial?(num) }
  end

  private
  def is_digit_factorial?(number)
    number == number.to_s.split("").map { |n| factorials[n.to_i] }.inject(:+)
  end
end

euler = DigitFactorials.new
euler.find_factorials
euler.find_digit_factorial
p euler.fact_sum

# Note: The upper bound is tricky and I'm not sure what is optimal. The bound
# here is based on retroactive lowering after getting the correct run time and
# only done for the sake of lowering run time.
# The absolute upper bound is 2540160 => (9!)*7:
  # In this problem, (9!)*7 corresponds to 9999999. 2540160 is a 7 digit number.
  # (9!)*8 is an 8 digit number, but its factorial products add to a 7 digit
  # number, meaning that the sum of factorials above 7 digits will always be
  # less than the number itself.
# After running the code with (factorials.last*7) I got the right answer and
# reduced it to factorials.last, sharply reducing runtime. The bound could,
# however, be set lower.
