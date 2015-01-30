class PrimeFinder
  attr_accessor :newnumm, :largestFact, :counter
  def initialize(num)
    @newnumm = num
    @largestFact = 0
    @counter = 2
  end

  def finder
    while ((counter**2) <= newnumm)
      if (newnumm % counter == 0)
        @newnumm /= counter
        largestFact = counter
      else
        @counter += 1
      end
      largest
    end
    newnumm
  end

  def largest
    @largestFact = newnumm if newnumm > largestFact
  end
end

euler = PrimeFinder.new(600851475143)
p euler.finder
