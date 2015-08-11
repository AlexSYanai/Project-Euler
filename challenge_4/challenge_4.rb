require 'benchmark'
def pal
	999.downto(900) do |n|
		999.downto(900) do |m|
			a = m * n
			return a if a.to_s.split("") == a.to_s.split("").reverse
		end
	end
end

p pal
# Old
# user     system      total        real
# 0.040000   0.000000   0.040000 (0.045775)
#
# New
# user     system      total        real
# 0.000000   0.000000   0.000000 (0.003516)
