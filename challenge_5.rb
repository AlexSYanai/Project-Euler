prime_multiplied = [5, 7, 9, 11, 13, 16, 17, 19].inject(:*)
nums = (1..20)

nums.each { |i| prime_multiplied % i }
p prime_multiplied
