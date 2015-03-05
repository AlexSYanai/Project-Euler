class IntegerRight
  attr_accessor :value_hash, :num_range
  def initialize(finish)
    @value_hash = {}
    @num_range  = (1..finish)
  end

  def hash_creator
    num_range.each { |i| value_hash[i] = 0 }
  end

  def find_integer_rights
    for i in (1..399) do
      for j in (i..399) do
        for k in (j..399) do
          value_hash[(i+j+k)] += 1 if i**2 + j**2 == k**2 && (i+j+k) < 1000
        end
      end
    end
  end

  def max_triples
    value_hash.key(value_hash.values.max)
  end
end

euler = IntegerRight.new(1000)
euler.hash_creator
euler.find_integer_rights
p euler.max_triples
