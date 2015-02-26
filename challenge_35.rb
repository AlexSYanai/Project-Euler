class CircularPrime #Slow bruteforce but effective and easily runs under a minute
  attr_accessor :prime_array, :circular_primes, :finish
  attr_reader   :finish

  def initialize(finish)
    @finish = finish-2
    @prime_array = []
    @circular_primes = [2,3,5,7,11]
  end

  def find_circular
    split = prime_array.map { |num| num.to_s.split("") }
    until split == nil || split.empty?
      current = split.pop  #Removing evens and 5 since any number containing them will have a circular number that's not prime
      unless current.include?("0") || current.include?("2") || current.include?("4") || current.include?("5") || current.include?("6") || current.include?("8")
        temp = []
        temp << [current.join("").to_i,current.rotate.join("").to_i] if split.include?(current.rotate)
        temp << current.rotate(2).join("").to_i if temp.flatten.length == 2 && split.include?(current.rotate(2))
        temp << current.rotate(3).join("").to_i if temp.flatten.length == 3 && split.include?(current.rotate(3))
        temp << current.rotate(4).join("").to_i if temp.flatten.length == 4 && split.include?(current.rotate(4))
        temp << current.rotate(5).join("").to_i if temp.flatten.length == 5 && split.include?(current.rotate(5))
        @circular_primes << temp if temp.flatten.length == current.length
      end
    end
  end

  def sieve_of_eratosthenes #Using only iteration => Ruby delete_if method slowed things down too much
    for i in 0..finish
      prime_array[i] = i+2
    end

    index = 0
    while prime_array[index]**2 <= prime_array.last
      @prime_array = prime_array.select { |x| x == prime_array[index] || x % prime_array[index] != 0 }
      index += 1
    end
  end
end

euler = CircularPrime.new(1000000)
euler.sieve_of_eratosthenes
euler.find_circular
p euler.circular_primes.flatten.uniq.sort
