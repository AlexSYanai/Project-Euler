class TrianglePath # Essentially Solution to #13 w/slight changes
  attr_reader   :filename
  attr_accessor :triangle_array

  def initialize(filename)
    @filename       = filename
    @triangle_array = []
  end

  def parse_file
    File.open(filename,'r').each_line do |line|
      triangle_array << line.chomp.split(" ").map { |number| number.to_i }
    end
  end

  def find_path
    i = (triangle_array.length - 1) #Start from the bottom and find the best last row pairs for each last-1th row element
    while i > 0
      for j in (0..(i-1))           #Iterate through each row and compare numbers in a pairwise fashion
        triangle_array[i-1][j] += [triangle_array[i][j],triangle_array[i][j+1]].sort.pop #Add highest to 1st row element
      end
      i -= 1
    end
    puts triangle_array.first.first
  end
end

yodle_triangle = TrianglePath.new('challenge_67_triangle.txt')
yodle_triangle.file_parser
yodle_triangle.find_path
