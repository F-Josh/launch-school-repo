=begin
PEDAC
PEDA
  Inputs - 1 argument - positive, negative or 0
  Outputs - Return true if the number's absolute value is odd
  Explicit - It's a valid integer value
  Questions- What is an odd number? numbers that don't divide evenly by 2
  Example puts is_odd?(2) => false
  puts is_odd?(0) => false
  puts id_odd(-17) => true
  DS - None
  Algorithm:
    multiply the number by itself and divde it by 2 to get it's absolute val
    return true if num % 2 != 0 else return false

Code with intent 
=end 

def is_odd?(num)
  #num2 = (num * num) 
  ans = num.remainder(2)
  ans != 0
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)  