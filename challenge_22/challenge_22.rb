name_file = File.open("challenge_22/challenge_22_names.txt",'r').read.gsub(/\W+/, ',').split(',').sort
alphabet_hash = Hash[("A".."Z").to_a.zip((1..26).to_a)]
letters = name_file.map { |name| name.split("").map { |letter| alphabet_hash[letter] } }.map { |n| n.inject(:+) }
letters.each_with_index { |name,index| letters[index] = name.to_i*(index) }
p letters.inject(:+)
