class TriangleWord
  attr_accessor :number_array,:word_array,:all_triangles,:triangles
  attr_reader   :file,:word_key
  def initialize(filename)
    @file       = filename
    @word_key   = Hash[('A'..'Z').zip(1..26)]
    @word_array = File.open(file,'r').read.gsub(/\W+/, ',').split(',').drop(1)
  end

  def convert_words
    @number_array = word_array.map { |word| word.split("").map { |letter| word_key[letter] }.inject(:+)  }
  end

  def generate_triangle_numbers
    @all_triangles = (1..(Math.sqrt(number_array.max)*2).to_i).map { |n| ((n**2)+n)/2 }
  end

  def find_triangle_numbers
    @triangles = number_array.select { |n| is_triangle?(n) }
  end

  def is_triangle?(num)
    all_triangles.include?(num)
  end
end

euler = TriangleWord.new('challenge_42/challenge_42_words.txt')
euler.convert_words
euler.generate_triangle_numbers
euler.find_triangle_numbers
p euler.triangles.count
