class KeyCode # Cool problem! I solved with logic, so one of the few problems that was harder to code than reason through
  attr_accessor :nums, :final_string, :begin_array, :end_array, :position_hash
  attr_reader   :filename, :num_string, :final_string

  def initialize(filename)
    @filename      = filename
    @num_string    = %w(0 1 2 3 6 7 8 9) # Removed 4 & 5 after output showed they're not present
    @nums          = []
    @final_string  = []
    @begin_array   = []
    @end_array     = []
    @position_hash = {before: {}, after: {}}
  end

  def parse_file
    File.open(filename,'r').each do |line|
      nums << line.chomp.to_s.split("") unless nums.include?(line.chomp)
    end
  end

  def create_order_hash
    num_string.each do |num|
      position_hash[:before][num] = []
      position_hash[:after][num]  = []
    end
    nums.each do |n|
      position_hash[:before][n[1]] << n[0] unless position_hash[:before][n[1]].include?(n[0])
      position_hash[:before][n[2]] << n[1] unless position_hash[:before][n[2]].include?(n[1])
      position_hash[:after][n[0]]  << n[1] unless position_hash[:after][n[0]].include?(n[1])
      position_hash[:after][n[1]]  << n[2] unless position_hash[:after][n[1]].include?(n[2])
    end
  end

  def assign_positions
    position_hash[:before].each { |k,v| begin_array[0] = k if v.empty? } # Number is first if no number comes before it
    position_hash[:after].each  { |k,v| end_array[0] = k if v.empty? }   # Number is last if no number comes after it
    position_hash[:before].each { |k,v| begin_array[1] = k if v.length == 1 && v.include?(begin_array[0]) } # Number only has first number before it
    position_hash[:after].each  { |k,v| end_array.unshift(k) if v.length == 1 && v.include?(end_array[0]) } # Number only has last number after it
    position_hash[:before].each { |k,v| begin_array << k if begin_array.sort == v.sort } # Assigns 6 and 2, since on their pass they're only procceeded by already assigned numbers
  end

  def assign_final_numbers
    begin_array << (num_string - [begin_array + end_array].flatten + end_array)
    @final_string = begin_array.flatten.join("")
  end
end

euler = KeyCode.new('challenge_79_keylog.txt')
euler.parse_file
euler.create_order_hash
euler.assign_positions
euler.assign_final_numbers
p euler.final_string
