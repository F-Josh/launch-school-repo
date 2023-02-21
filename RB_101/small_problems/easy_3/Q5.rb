
def multiply(param1, param2)
  param1 * param2
end

def square(num, n)
  multiply(num, num) * (num ** (n - 2))
end

puts square(5, -1) == 0.2

def multiply(x, y)
  x * y
end

# Returns num ** n. Set mem = num when calling.
def power(num, n, mem)
  return 1 if n == 0
  return mem if n == 1

  power(num, n - 1, multiply(mem, num))
end

puts power(5, 0, 5) == 1
puts power(2, 3, 2) == 8
puts power(-3, 5, -3) == -243


def multiply(x, y)
  x * y
end

# Returns num ** n. Set mem = num when calling.
def power(num, n, mem)
  return 1 if n == 0
  return mem if n == 1

  power(num, n - 1, multiply(mem, num))
end

puts power(5, 0, 5) == 1
puts power(2, 3, 2) == 8
puts power(-3, 5, -3) == -243