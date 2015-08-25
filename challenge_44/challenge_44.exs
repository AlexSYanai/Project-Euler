defmodule Pentagonal do
	def nums(_,pent) when pent  > 0,do: pent
	def nums(i,pent) when pent == 0 do
		nums(i+1,find(i-1,gen(i),pent))
	end

	def find(j,_,pent) when j  < 1 or pent > 0, do: pent
	def find(j,a,pent) when j >= 1 do
		b = gen(j)
		if both?(a,b), do: pent = (a - b)
		find(j-1,a,pent)
	end

	def gen(n) do 
		div((n * ((n * 3) - 1)),2)
	end

	def pent?(n) do
		m = (:math.sqrt((24 * n) + 1) + 1)
		(rem(round(Float.floor(m)),6) == 0) and (rem(round(Float.ceil(m)),6) == 0)
	end

	def both?(n,m), do: (pent?(n-m) and pent?(n+m))
end

IO.inspect Pentagonal.nums(2,0)
