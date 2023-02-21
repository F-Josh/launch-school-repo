=begin
PEDAC
PEDA
  Inputs - 1 argument - a positive integer
  Outputs -  Return the string of 1s and 0s
  Problem domain-  An integer is a whole number and can be positive or negative
  Explicit /Implicit - The output should start counting from 1

  Questions- How do you handle 0? and negative numbers? 

  Example:
    puts stringy(6) == '101010'
    puts stringy(9) == '101010101'
    puts stringy(4) == '1010'
    puts stringy(7) == '1010101'

  Algorithm:
    - Validate your input to make sue its an integer
    - push 1s and 0s into the array until array is full
    - Check for space after each push

Code with intent 
=end

def stringy(num, start=1)
  arr = []
  if start == 0
    num.times do |idx|
      arr << idx.even? ? '0' : '1'
    end
  else
    loop do
      arr << '1' if arr.size != num
      arr << '0' if arr.size != num
      break if arr.size == num
    end
  end
  arr.join
end

puts stringy(0) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

