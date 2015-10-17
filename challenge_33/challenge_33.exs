use Bitwise
defmodule CancellingFractions do
  def find(num_prod,den_prod,i,_) when i > 98 do
    div(den_prod,num_prod)
  end

  def find(num_prod,den_prod,i,j) when j <= 109 do
    unless rem(i,10) == 0 and (j &&& 10) == 0 do
      i_n = Integer.to_string(i)
      j_d = Integer.to_string(j)

      num = String.to_integer(String.at(i_n,0))
      den = String.to_integer(String.at(j_d,1))

      if String.at(i_n,1) == String.at(j_d,0) and  num < den do
        if (i/j) == (num/den) do
          num_prod = num_prod * i
          den_prod = den_prod * j
        end
      end

    end
    find(num_prod,den_prod,i,j+1)
  end

  def find(num_prod,den_prod,i,_) when i <= 98 do
    find(num_prod,den_prod,i+1,11)
  end
end

IO.inspect CancellingFractions.find(1,1,10,11)
