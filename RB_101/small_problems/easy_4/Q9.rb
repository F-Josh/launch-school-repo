=begin
PEDAC PROCESS
P - A method that converts a string to a signed number
  - Input - Taks a string of digits
  - Output - Return an appropriate number as an integer
  - Deals with signed numbers- If the string starts with + sign, 
   - method should return a positive number
   - if it is a -, starts with negative
   - If no sign is given, return a positive number

  Questions:
  - Do we have to to validate the method argument??
  - 

  -Explicit - You may assume that the string always contain a valid number
  - Implicit - 

E - Examples:
  string_to_signed_integer('4321') == 4321
  string_to_signed_integer('-570') == -570
  string_to_signed_integer('+100') == 100
  

D - Data structures
  - N/A

A - Algorithm
    - Define your method to accept a string of digits
    - Define a helper method that does the conversion of string to digits
      - This method will receive a char, do the conversion with a hash 
        and return an integer. 
    -Check to see if the first char in a string is a + or - 
     - if yes, take note of the sign and delete the first char
    - convert the string into an array of characters
    - Use the map! method to convert each element into an intger
      by calling the conversion method.
    - Initialize a local variable prev_num = 0
    - Iterate over the converted array using Array#inject using 0 as the 
        method argument and 2 block arguments, memo and curr_num
      - While in the block, prev_num = prev_num * 10 + curr_num
    -  Outside the block, check if sign == -, if yes return 0 - prev_num * -1
    -Else return prev_num
    -End 

C - Code with intent - Consider the language limitations here
=end


def string_to_integer(char)
  char.downcase!
  hash = {'0'=> 0, '1'=> 1, '2'=> 2, '3'=> 3, '4'=> 4, '5'=> 5, '6'=> 6,
          '7'=> 7, '8'=> 8, '9'=> 9, 'A' => 10, 'B' => 11, 'C' => 12,
          'D' => 13, 'E' => 14, 'F' => 15 
        }
  hash[char]
end

def string_to_signed_integer(str)
  sign = str[0]
  str.delete!(sign) if sign == '+' || sign == '-'

  str_arr = str.chars
  str_arr.map! {|elem| string_to_integer(elem)}
  prev_num = 0
  str_arr.inject(0) {|_, num| prev_num = prev_num * 10 + num}

  return 0 - prev_num if sign == '-'
  prev_num
end

p string_to_signed_integer('4321')
p string_to_signed_integer('-570')
p string_to_signed_integer('+100')


# best so far 

def str_char_to_int(char)
  str_to_int_hash = {
    "0"=> 0, "1"=> 1, "2"=> 2, "3"=> 3, "4"=> 4,
    "5"=> 5, "6"=> 6, "7"=> 7, "8"=> 8, "9"=> 9,
    "a"=> 10, "b"=> 11, "c"=> 12, "d"=> 13, "e"=> 14, "f"=>15
  }
  str_to_int_hash[char]
end

def string_to_integer(str)
  str.downcase!
  str_arr = str.chars
  int = 0
  str_arr.map! {|char| str_char_to_int(char)}
  str_arr.reduce {|memo, int| memo*10 + int}
end

def strip_leading!(str)
  case str[0]
  when '-'
    str.delete('-')
  when '+'
    str.delete('+')
  else
    str
  end
end

def string_to_signed_integer(str)
  clean_str = strip_leading!(str)
  int = string_to_integer(clean_str)
  str[0] == '-' ? -int : int
end