class SundayCount
	attr_reader :year_range
	attr_accessor :sunday_first_counter, :first_day_of_the_month
	def initialize(start,finish)
		@year_range = (start..finish) #I ran this with range (1900...1901) and first_day as 1
		@sunday_first_counter = 0 	  #(Monday, given) to get first of 1901 (Tuesday, first = 2)
		@first_day_of_the_month = 2   #long and a bit clunky
	end

	def month_calculator(month)
		@first_day_of_the_month = (month + first_day_of_the_month) % 7
		@sunday_first_counter += 1 if first_day_of_the_month == 0
	end

	def increment_month
		for year in year_range
			year_array = [31,28,31,30,31,30,31,31,30,31,30,31]
			year_array[1] = 29 if is_leap_year?(year)

			year_array.each { |month| month_calculator(month) }
		end
	end

	def is_leap_year?(year)
		year % 4 == 0 unless year % 100 == 0 && year % 400 != 0 #Returns non-4-multiple centuries as nil...which evals
	end															#to false. So it works.
end

euler = SundayCount.new(1901,2000)
euler.increment_month
p euler.sunday_first_counter
