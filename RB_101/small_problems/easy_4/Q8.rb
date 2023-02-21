=begin
PEDAC PROCESS
P - A method that converts a string to a integer
  - Input - Taks a string of digits
  - Output - Return an appropriate number as an integer

  Questions:
  - Do we have to to validate the method argument??
  - 

  -Explicit - Do not worry about about +, - signs and invalid characters
  and that all characters are numeric
  - Implicit - 

E - Examples:
  string_to_integer('4321') == 4321
  string_to_integer('570') == 570
  

D - Data structures
  - N/A

A - Algorithm
    - Define your method with a single parameter
    - Create a hash and map each numeric character to integer version '1'=> 1
    - create and array of characters using the string argument provided
    - Initialize a variable previous_value  = 0 for keeping track of the prev v
    - Iterate over each char in the array using each
    - To computer numeric value, we take each digit and add it to 10 times
    - The previous value
    - Get the digit from the hash, using each element as the key
    - integer_value = 10 * prev value + current value from hash
    - pre_value  = integer_value
    - Return prev_value which is now the value in digits

C - Code with intent - Consider the language limitations here
=end

def string_to_integer(string)
  digit_hash = {"0" => 0, "1" => 1, "2" => 2, "3" => 3, 
  "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9
  }
  total = 0
  char_array = string.chars
  char_array.each do |elem|
    num_value = digit_hash[elem]
    num_value_base_ten =  10 * total + num_value
    total = num_value_base_ten
  end
  total
end
p string_to_integer('4321')
p string_to_integer('570')

def hexadecimal_to_integer(hexa)
  hex_hash = {
    "0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5,
    "6" => 6, "7" => 7, "8" => 8, "9" => 9, "A" => 10, "B" => 11, "C" => 12,
    "D" => 13, "E" => 14, "F" => 15
  }

  hex_array = hexa.chars
  prev_val = 0
  hex_array.each do |elem|
    curr_val = hex_hash[elem]
    val_in_base_10 = 16 * prev_val + curr_val
    prev_val = val_in_base_10
  end
  prev_val
end
p hexadecimal_to_integer('4D9F')

# exlore further
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

def hexadecimal_to_integer(str)
  str.downcase!
  str_arr = str.chars
  int = 0
  str_arr.map! {|char| str_char_to_int(char)}
  str_arr.reduce {|memo, int| memo*16 + int}
end