
=begin
def car(new_car)
  make = make(new_car)
  model = model(new_car)
  [make, model]
end 
def make(new_car)
  new_car.split(" ")[0]
end 
def model(new_car)
  new_car.split(" ")[2]
end 
make, model = car("Ford Mustang")
puts make == "Ford"
puts model.start_with?("M")
=end

=begin
require "pry"
counter = 0
loop do
  counter += 1
  binding.pry
  break if counter == 5
end
=end

=begin 
the Kernel.tap() method yields self to a block, and returns self.
The primary purpose of this method is to "tap into" a method chain, in other to
perform operations on intermediate results within the chain
(1..10)                     .tap { |x| p x }
  .to_a                     .tap { |x| p x }
  .select { |x| x.even? }   .tap { |x| p x }
  .map {|x| x * x }         .tap { |x| p x }
=end




=begin
def add_name(name)
  puts name.object_id
  name = "hello"
  puts name.object_id
end
name = "Obinna"
puts name.object_id
add_name(name)
puts name
puts name.object_id
=end

=begin
new_hash = Hash.new(0)
new_hash = {player: += 1, soccer: += 1}
new_hash[:player]
p new_hash
end

=end 
# Given this data structure write some code to return an array containing the 
# colors of the fruits and the sizes of the vegetables. 
# The sizes should be uppercase and the colors should be capitalized.

=begin
Psuedo-codes

A method that returns the sum of two integers
Informal:
- Ask the user for the first integer and save it in a variable
- Ask the user for the second integer and save it in a variable
- Convert both variables to integer using to String#to_i method
- Use the + operator to add the 2 integer objects saved in the variable 
- Display result

Formal:
- SET first_number = gets.chomp
-SET second_number = gets.chomp
- SET sum = first_number.to_i + seecond_number.to_i
- PRINT sum


A method that takes and array of string and retusn those strings concatenated
together:
Informal:
- Intialize a variable to an empty string
- Iterate over the array while concatenating every string in the array to the 
new string variable on each iteration.
- PRINT the new_string variable

Formal:
- SET new_string = ""
- Iterate over the array using Array#each method and while iterating
    new_string << array_element
- PRINT new_string

A method that takes an array of integers, and returns a new array with every 
other element from the original array, starting with the first element

informal:
- Intialize a variable answer to an empty array
- Initialize a variable start to the integer 0
- Iterate through the given array and while doing so 
   - push the first element to new array i.e arr[start] to the new array
   - Increment start by 2 
- PRINT new array

FORMAL:
- SET new_array = []
- SET start = 0
- ITERATE the input array using while start < arr.size
    - new_array << arr[start]
    - start += 2
end 
- PRINT new_array

A method that determines the index of the 3rd occurence of a character in a str
INFORMAL 
- Initialize a variable counter = 0
- Invoke the String#split method to convert the string to an array of charactrs
- Iterate over the array using array#each
- compare each element in the array to the given character
- Incremenet counter when the element matches the given character
- Check if the counter == 3, and if yes, return the index of the element using
  Arra#index method
PRINT index

FORMAL:
- SET counter = 0
- SET char_array = arr.split
- Iterate over the array using Enumerable#each method
    - IF elem == given character
        counter += 1
        return char_arr.index if counter == 3
    return nil


A method that takes two arrays of numbers and reurns the result of merging arrs

INFORMAL:
- Initialize a variable merged_arr to an empty arr object
- Initialize an even pointer to 0
- Initialiaze an odd pointer = 1
- Iterate over the first array and build even elements of the merged arr 
  while incrementing the even pointer
- iterate over the deond array and do same building the even elements
   while incrementing odd pointer

  FORMAL:
  SET merged_array = []
  even = 0
  odd = 1
  first.each{|elem| merged_array[even] = elem, even += 2}
  second.each{|elem| merged_array[odd] = elem, odd += 2}
  PRINT merged_array

=end

hsh = {name: 'obinna', age: [1, 2, 3, 4], year:[120, 134, 122]}

def print_it(hsh)
  first = hsh[:age].join(', ')
  puts "#{first}"
end

print_it(hsh)







