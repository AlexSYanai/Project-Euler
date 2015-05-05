require 'benchmark'
def pal
	num_array = []
	999.downto(900) do |n|
		999.downto(900) do |m|
			a = m * n
			b = a.to_s.split("")
			return a if b[0] == b[5] && b[1] == b[4] && b[2] == b[3]
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
