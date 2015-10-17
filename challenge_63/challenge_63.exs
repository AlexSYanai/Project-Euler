defmodule PowerfulDigits do
  def counts(_,_,count,len_bool) when len_bool == false, do: count

  def counts(exp,num,count,len_bool) when len_bool == true do
    if num != 9, do: [num,count] = exps(num,num,exp,count), else: count = count + 1
    counts(exp+1,num,count,same_len?(9,exp))
  end

  def exps(num,n,_,count) when n > 9 do
    [num,count]
  end

  def exps(num,n,exp,count) when n <= 9 do
    if same_len?(n,exp), do: count = count + 1, else: (if n > num, do: num = n)
    exps(num,n+1,exp,count)
  end

  def same_len?(n,exp), do: exp == round(:math.pow(n,exp)) |> to_string |> String.length()
end

IO.inspect PowerfulDigits.counts(1,1,0,true)
