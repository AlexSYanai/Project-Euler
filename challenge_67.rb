class TrianglePath # Essentially Solution to #13 w/slight changes
  attr_reader   :filename
  attr_accessor :tri_nums

  def initialize(filename)
    @filename = filename
    @tri_nums = []
  end

  def parse_file
    File.open(filename,'r').each_line do |line|
      tri_nums << line.chomp.split(" ").map { |number| number.to_i }
    end
  end

  def find_path
    (tri_nums.length - 1).downto(0) do |i|  # Start from the bottom and find the best last row pairs for each last-1th row element
      (0..(i-1)).each do |j|                # Iterate through each row and compare numbers in a pairwise fashion
        tri_nums[i][j] > tri_nums[i][j+1] ? tri_nums[i-1][j] += tri_nums[i][j] : tri_nums[i-1][j] += tri_nums[i][j+1] # Add highest to 1st row element
      end
    end
    puts tri_nums.first.first
  end
end

yodle_triangle = TrianglePath.new('challenge_67_triangle.txt')
yodle_triangle.parse_file
yodle_triangle.find_path
