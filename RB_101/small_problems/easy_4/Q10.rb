=begin
PEDAC PROCESS
P - A method that converts a number to a string.
  - Input - Accepts a positive integer or 0
  - Output - Returns an appropriate string representation

  Questions:
  - Do we have to to validate the method argument??
  - 

  -Explicit - You may assume that the string always contain a valid number
  - Implicit - 

E - Examples:
  integer_to_string(4321) == '4321'
  integer_to_string(0) == '0'
  integer_to_string(5000) == '5000'
  
  

D - Data structures
  - N/A

A - Algorithm
    - Define your method to accept a string of digits
    - Define a helper method that does the conversion of digits to string
      - This method will receive a digit, do the conversion with a hash 
        and return a string. 
    - Initialize a an empty string str_value = ''
    - convert the string to an array of digits using num.digits.reverse
    - Use the map! method to covert the elements of the array to string by 
    by calling the helper method and passing it each digit
    - While iterating over the arry of digits, use str#concat or + to concat
    enate str_value to each string in the arr. 
    - Return
    -End 

C - Code with intent - Consider the language limitations here
=end

def convert_digit_to_string(digit)
  hash = {0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6',
          7 => '7', 8 => '8', 9 => '9', 10 => 'A', 11 => 'B', 12 => 'C',
          13 => 'D', 14 => 'E', 15 => 'F'
        }
  hash[digit]
end

def convert_number_to_array_digits(number)
  return [0] if number == 0
  arr = []
  while number != 0
    temp = number % 10 
    arr.unshift(temp)
    number = number / 10
  end
  arr
end

def integer_to_string(number)
  digits_arr = convert_number_to_array_digits(number)
  str_value = ''
  digits_arr.map {|elem| str_value += convert_digit_to_string(elem)}
  str_value
end

def signed_integer_to_string(num)
  return '0' if num == 0
  abs_num = num.abs

  ans = integer_to_string(abs_num)
  return "-#{ans}" if abs_num != num
  "+#{ans}"
end

p signed_integer_to_string(4321) 
p signed_integer_to_string(-123)
p signed_integer_to_string(0)

# p integer_to_string(4321)
# p integer_to_string(0)
# p integer_to_string(5000)

