class FindNonAbundant #Started by recycling previous challenges...took a while and was fruitless
  attr_accessor :abundant_array, :summed_abundants
  attr_reader :final
  def initialize(final)
    @final = final
    @abundant_array = []
    @summed_abundants = []
  end

  def find_abundants
    (2..final).each { |num| abundant_array << num if is_abundant?(num) }
  end

  def is_abundant?(number)
    number < find_divisors(number)
  end

  def find_divisors(number)
    sum = 1

    for i in (2..Math.sqrt(number))
      if number % i == 0
        sum += number / i if i != Math.sqrt(number)
        sum += i
      end
    end
    sum
  end

  def find_summed
    abundant_array.each do |first|
      abundant_array.each do |second|
        abundant_sum = first+second
        break if abundant_sum > final
        summed_abundants << abundant_sum
      end
    end
  end

  def summed
    return ((1..final).to_a - summed_abundants).inject(:+)
  end

end

euler = FindNonAbundant.new(28123)
euler.find_abundants
euler.find_summed
p euler.summed
