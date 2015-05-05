prime_multiplied = [5, 7, 9, 11, 13, 16, 17, 19].inject(:*)
nums = (1..20).to_a
largest = 0

prime_multiplied.downto(0) do |n|
  remainders = nums.map { |m| n % m }
  if remainders.all? { |m| m % n == 0 }
    largest = n
    break
  end
end

p largest
