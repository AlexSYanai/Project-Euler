class Convergent
  attr_accessor :result,:numerator,:denominator
  attr_reader   :upper
  def initialize
    @upper = 100
    @result = 0
    @numerator = 2
    @denominator = 1
  end

  def find_convergence
    (2..upper).each do |i|
      temp,@denominator = denominator,numerator
      (i % 3 == 0) ? convergent = 2 * (i/3) : convergent = 1
      @numerator = (convergent * denominator) + temp
    end
  end

  def calculate_result
    @result = numerator.to_s.split("").map { |num| num.to_i }.inject(:+)
  end
end

euler = Convergent.new
euler.find_convergence
euler.calculate_result
p euler.result
