p (1..500).map{|box_value| (4*((2*box_value)+1)**2 - (12*box_value))}.inject(:+)+1
