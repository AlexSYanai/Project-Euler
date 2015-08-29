base_exp_pairs = []
File.open('challenge_99/challenge_99_exps.txt','r').each_line do |line| 
	nums = line.chomp.split(",").map(&:to_i)
	base_exp_pairs << (nums[1] * Math.log(nums[0])) # Log => instead of exponents
end

p base_exp_pairs.index(base_exp_pairs.max) + 1
