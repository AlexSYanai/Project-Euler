def fib(num1,num2,counter) 
	return counter+1 if num2.to_s.split(//).length == 1000
	fib(num2,(num1 + num2),counter+= 1)
end

p fib(0,1,0)