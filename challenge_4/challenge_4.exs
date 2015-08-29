defmodule PalindromicProduct do
	def find_palindrome(limit) do
		prime_products(limit,limit,0,limit)
	end

	def prime_products(m,n,_,limit) when n <= 899 do
		prime_products(m - 1,limit - 1,0,limit)
	end

	def	prime_products(_,_,found,_) when found > 0 do
		found	
	end

	def prime_products(m,n,found,limit) when n > 899 do
		if palindrome?(to_string(m*n)), do: found = m*n
		prime_products(m,n - 1,found,limit)
	end

	def palindrome?(prod), do: prod == String.reverse(prod)
end

IO.inspect PalindromicProduct.find_palindrome(999)