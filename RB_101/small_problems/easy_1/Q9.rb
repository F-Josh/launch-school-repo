=begin
PEDAC
PEDA
  Inputs - 1 argument, a positive integer
  Outputs -  Return sum of its digit
  Problem domain-  An integer is a whole number and can be positive or negative
  Explicit /Implicit - Will always be a positive integer
  - Result should be an integer

  Questions- 

  Example:
    puts sum(23) == 5
    puts sum(496) == 19
    puts sum(123_456_789) == 45

  DS- An array to store each digit

  Algorithm:
  - Validate your input for empty values and to make sure it's a valid integer
    - Initialize a sum variable for holding the sum
    - convert the input to a string then chars
    - Convert back each element in the arry to an integer
    - Add each element to the sum variable
    - Return sum/ num 

Code with intent 
=end

def sum(num)
  return "Wrong argument(enter a valid integer)" if num.class != Integer
  total = 0
  digits_array = num.digits
  digits_array.inject(&:+)
end

puts sum(123_456_789)