def cancelling_fractions
  num_prod, den_prod = 1,1

  (10..98).each do |i|
    (11..109).each do |j|
      next if i % 10 == 0 && j & 10 == 0

      fract = (i.to_s[1]).to_f/(j.to_s[0]).to_f if (i.to_s[0] == j.to_s[1] && i.to_s[1] < j.to_s[0])
      fract = (i.to_s[0]).to_f/(j.to_s[1]).to_f if (i.to_s[1] == j.to_s[0] && i.to_s[0] < j.to_s[1])

      if i.fdiv(j) == fract
        num_prod*=i
        den_prod*=j
      end
    end
  end
  den_prod/num_prod
end

p cancelling_fractions
