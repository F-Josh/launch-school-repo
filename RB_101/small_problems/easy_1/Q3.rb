=begin
PEDAC
PEDA
  Inputs - 1 argument - a positive integer
  Outputs - A list of the digits in the number
  Problem domain- 
    A positive integers are all whole numbers greater than 0: 1, 2, 3, 4, 5
    0 is neither positive nor negative
  Explicit - Negatives are not allowed
  Questions- 

  Example puts is_odd?(2) => false
    puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
    puts digit_list(7) == [7]                     # => true
    puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
    puts digit_list(444) == [4, 4, 4]             # => true
  DS - Array for storing the digits
  Algorithm:
    - We can convert the input to a string, then chars and map each element
      to an int to convert back to an int in an array
    - We can also use the Array#digits method then reverse the array
    - We can also use recursion- define a base case if num == 0 intialize an
    empty array, push to the array num/10 and call the method on num /10
    - We can also use Maths - Getting the last digit and reducing num by num/10

Code with intent 
=end

# Solution 1
=begin
def digit_list(num)
  num_char = num.to_s.chars
  p num_char.map(&:to_i)
end
puts digit_list(12345) == [1, 2, 3, 4, 5]


def digits_list(num)
  # base case 
  return [] if num == 0
  return digits_list(num / 10) << num.remainder(10)
end 

p digits_list(12345) == [1, 2, 3, 4, 5]
=end 

def digits_list(number)
  arr = []
  loop do 
    arr.unshift(number.remainder(10))
    number /= 10
    break if number == 0
  end
  arr
end

p digits_list(12345)
