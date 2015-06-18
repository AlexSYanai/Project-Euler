class Integer 
  def factor
    return 1 if self < 1
    i,j = 1,1

    while j <= self
      i *= j
      j += 1
    end
    i
  end

  def next_number
    num = self
    ret_val = 0
    while num > 0
      digit = num % 10
      ret_val += digit**2
      num /= 10
    end
    ret_val
  end
end

class DigitChains
  attr_accessor :digit_array,:total_nums
  attr_reader   :finish,:max_digits
  def initialize(finish)
    @finish = finish
    @max_digits = 7
    @digit_array = Array.new(max_digits) { 0 }
    @total_nums = 0
  end

  def combinations
    i = (max_digits - 1)
    loop do
      break if i == 0 && digit_array[i] == 9
      if i == (max_digits - 1) && digit_array[i] < 9
        digit_array[i] += 1
        @total_nums += check_number(digit_array)
      elsif digit_array[i] == 9
        i -= 1
      else
        digit_array[i] += 1
        ((i+1)...max_digits).each { |j| digit_array[j] = digit_array[i] }
        i = (max_digits - 1)
        @total_nums += check_number(digit_array)
      end
    end
  end

  def check_number(num)
    num_array = Array.new(num) { 0 }  
    check = 0

    (0...num_array.length).each { |i| check = check*10 + num_array[i] }
    check = check.next_number while check != 89 && check != 1
    return modify_total(num_array) if check == 89
    return 0
  end

  def modify_total(num_array)
    num_digits = Array.new(10) { 0 }
    (0...num_array.length).each { |i| num_digits[num_array[i]] += 1 }
    @total_nums = num_array.length.factor
    (0...num_digits.length).each { |i| @total_nums /= num_digits[i].factor }
    total_nums
  end
end

euler = DigitChains.new(10000000)
euler.combinations
p euler.total_nums