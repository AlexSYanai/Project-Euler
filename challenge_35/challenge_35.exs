defmodule SieveofEratosthenes do
  def init_sieve(lim) do
    find_primes(2,lim,(2..lim))
  end

  def find_primes(counter,limit,nums) when (counter * counter) > limit do
    nums
  end

  def find_primes(counter,limit,nums) when (counter * counter) <= limit do
    find_primes(counter+1,limit,Enum.reject(nums,&(rem(&1,counter) == 0 and &1 > counter)))
  end
end


defmodule CircularPrime do
  def gen(circulars,all_primes) do
    primes = all_primes
      |> Stream.map(&(Integer.to_string(&1)))
      |> Enum.reject(&(strs(&1)))

    find(primes,primes,circulars)
      |> Enum.count()
      |> IO.inspect
  end

  def find([],_,circulars), do: circulars
  def find([prime|primes],primes1,circulars) do
    if rotate_all(prime,String.length(prime),primes1), do: circulars = [prime] ++ circulars
    find(primes,primes1,circulars)
  end

  def rotate_all(x,l,p), do: 1..l |> Enum.all?(fn n -> Enum.member?(p,rotate(x,n)) end)
  def rotate(s,l),       do: String.slice(s,l..String.length(s)) <> String.slice(s,0..l-String.length(s)-1)
  def strs(n),           do: String.match?(n,~r/[024568]/)
end

primes = SieveofEratosthenes.init_sieve(1_000_000) -- [2,3,5,7,11]
CircularPrime.gen(["2","3","5","7","11"],primes)
