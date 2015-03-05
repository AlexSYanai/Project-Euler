class PrimeSum
  attr_accessor :
  attr_reader   :finish
  def initialize(finish)
    @finish = finish
  end

  def sieve_of_eratosthenes
    (0..finish).each { |i| prime_array[i] = i+2 }
    index = 0
    while prime_array[index]**2 <= prime_array.last
      @prime_array = prime_array.select { |x| x == prime_array[index] || x % prime_array[index] != 0 }
      index += 1
    end
  end
end

euler = PrimeSum.new(1000000)
euler.sieve_of_eratosthenes
# const int limit = 1000000;
# long result = 0;
# int numberOfPrimes = 0;
# long[] primes = ESieve(1,limit);
# long[] primeSum = new long[primes.Length+1];
#
# primeSum[0] = 0;
# for (int i = 0; i < primes.Length; i++) {
#   primeSum[i+1] = primeSum[i] + primes[i];
# }
#
# for (int i = numberOfPrimes; i < primeSum.Length; i++) {
#   for (int j = i-(numberOfPrimes+1); j >= 0; j--) {
#     if (primeSum[i] - primeSum[j] > limit) break;
#
#       if (Array.BinarySearch(primes, primeSum[i] - primeSum[j]) >= 0) {
#         numberOfPrimes = i - j;
#         result = primeSum[i] - primeSum[j];
#       }
#     }
#   }
