
def factors(number)
  divisor = number
  factors = []
  while number >= 1
    factors << number / divisor if number % divisor == 0
    divisor -= 1
    break if divisor == 0
  end 
  factors
end
p factors(0)