def gen_fib
  f_arr = [0,1]
  2.upto(33) { |n| f_arr << f_arr[n - 1] + f_arr[n - 2] }
  fibs_even = f_arr.select(&:even?).inject(:+)
end

p gen_fib
