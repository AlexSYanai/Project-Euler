prime_multiplied = [5, 7, 9, 11, 13, 16, 17, 19].inject(:*)
largest = 0

prime_multiplied.downto(0) do |n|
  remainders = (1..20).map { |m| n % m }.all? { |x| x == 0 }
  if remainders
    largest = n
    break
  end
end

p largest
