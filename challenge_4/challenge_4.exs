defmodule PalindromicProduct do
	def find_palindrome(limit) do
		prime_products(limit,limit,0,limit)
	end

	def prime_products(m,n,_,limit) when n <= 899 do
		m = m - 1
		n = limit - 1
		
		prime_products(m,n,0,limit)
	end

	def	prime_products(_,_,found,_) when found > 0 do
		IO.puts found	
	end

	def prime_products(m,n,found,limit) when n > 899 do
		prod = m*n
		if palindrome?(to_string(prod)) do
			found = prod
		end 
		n = n - 1

		prime_products(m,n,found,limit)
	end

	def palindrome?(prod) do
		prod == String.reverse(prod)
	end
end

PalindromicProduct.find_palindrome(999)