# 1. Bruteforced key creation - all possible combinations
# 2. Tested all keys against the first 3 characters of
# 	 the message
# 3. All combinations had a non-letter character first
#    - Assume that the message follows English conventions
#		   and begins with a capital, then lower case
#    - Can eliminate most starting chars following the same
# 		 logic => Possible chars:
#				-  (
# 			-  -
# 			-  space
# 4. Began by assuming that the first character is (
#		 - Check 6 values for each => to see if any words pop out
#		 - Don't know how long first word is so check for vals that
# 		 are any case or a space/punctuation
# 5. The characters '(The G' are the only ones that might make
#  	 a word.
# 6. Tested the key against the full cipher => works
#
# ------------------------------------------------------------
#
# $original = [79,59,12,2,79,35]
# $decoded = []
# $chrs = []

# def decode_original
# 	(97..122).each do |i|
# 		(97..122).each do |j|
# 			(97..122).each do |k|
# 				letters = []
# 				letters << ($original[0]^i).chr if ($original[0]^i).chr == '('
# 				letters << ($original[1]^j).chr if $caps.include?(($original[1]^j).chr)
# 				letters << ($original[2]^k).chr if $lows.include?(($original[2]^k).chr)
# 				letters << ($original[3]^i).chr if $caps.include?(($original[3]^i).chr) || $lows.include?(($original[3]^i).chr) || ($original[3]^i).chr == " " 
# 				letters << ($original[4]^j).chr if $caps.include?(($original[4]^j).chr) || $lows.include?(($original[4]^j).chr) || ($original[4]^j).chr == " " 
# 				letters << ($original[5]^k).chr if $caps.include?(($original[5]^k).chr) || $lows.include?(($original[5]^k).chr) || ($original[5]^k).chr == " " 
# 				if letters.length == 6
# 					$decoded << letters 
# 					$chrs << [i,j,k]
# 				end
# 			end
# 		end
# 	end
# end

# $caps = ('A'..'z').to_a
# $lows = ('a'..'z').to_a
# decode_original

# $decoded.sort_by { |n| n[0] }.reverse
# File.open('59_output.txt','w') do |file|
# 	$decoded.each_with_index do |n,i|
# 		file.write("Decoded: #{n.join("")}, ASCII: #{$chrs[i]}, \n")
# 	end
# end
# p $decoded.length#.map { |n| n.map(&:chr) }

class Encryption
	attr_reader :cipher,:filename
	attr_accessor :encrypted,:cipher_key,:decrypted
	def initialize(file,cipher)
		@filename  = file
		@cipher 	 = cipher
		@encrypted = ""
	end

	def parse_encoded_file
		File.open(filename,'r').each_line { |line| encrypted << line.chomp }
		@encrypted = encrypted.split(",").map(&:to_i)
	end

	def create_cipher_key
		@cipher_key = cipher*(encrypted.length/3)
		unless encrypted.length % 3 == 0
			encrypted.length % 3 == 1 ? cipher_key << cipher_key[0] : cipher_key << cipher_key[0] << cipher_key[1]
		end
	end

	def decrypt_cipher
		@decrypted = encrypted.zip(cipher_key).map { |n| (n[0]^n[1]) }
	end

	def print_deciphered_text
		decrypted.map(&:chr).join("")
	end

	def print_original_text_sums
		puts "MESSAGE\n=======\n#{print_deciphered_text}\n=======\nSum of Original ASCII Values: #{decrypted.inject(:+)}"
	end
end

euler = Encryption.new('challenge_59_cipher.txt',[103, 111, 100])
euler.parse_encoded_file
euler.create_cipher_key
euler.decrypt_cipher
euler.print_original_text_sums