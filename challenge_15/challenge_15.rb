def find_factorial(n)
    return 1 if n == 0
    return n * find_factorial(n-1)
 end

def lattice_paths(rows,cols)
  find_factorial(rows+cols)/(find_factorial(rows)*find_factorial(cols))
end

p lattice_paths(20,20)
