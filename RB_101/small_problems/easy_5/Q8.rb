
=begin
PEDAC PROCESS
P - A method that takes an array of integers between 0 - 19
  - Return an array of those integers sorted based on the English words
    for each number
  - Input - An array of integers between 0 - 19
  - Output an array of those inetgers sorted based on english words for each
  
  Questions:
  - Do we have to validate the input?

  -Explicit :
  - Implicit -  eNGLISH WORDS WILL BE IN LOWER CHARACTER

E - Examples:
    alphabetic_number_sort((0..19).to_a) == [
    8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
    6, 16, 10, 13, 3, 12, 2, 0
    ]
  
  
  

D - Data structures 
  - a Hash that will map each integer value to it's english words

A - Algorithm
    - Define your method to accept string argument
    - Initialize a hash that will map each integer number to it's english word
    - Call the Enumerable_sort_by method which returns an array
    - Return the result of calling Enumerable which is an array

C - Code with intent - Consider the language limitations here
=end

def alphabetic_number_sort(arr)
  int_hash = {
              0 => 'zero', 1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four',
              5 => 'five', 6 => 'six', 7 => 'seven', 8 => 'eight', 9 => 'nine',
              10 => 'ten', 11 => 'eleven', 12 => 'tweleve', 13 => 'thirteen',
              14 => 'fourteen', 15 => 'fifteen', 16 => 'sixteen',
              17 => 'seventeen', 18 => 'eighteen', 19 => 'nineteen'
            }
  ans = int_hash.keys.sort_by {|elem| int_hash[elem]}
  #ans.map!{|elem| elem[0]}

end

# Further Exploration - use Enumerable#sort

def alphabetic_number_sort2(arr)
  int_hash = {
              0 => 'zero', 1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four',
              5 => 'five', 6 => 'six', 7 => 'seven', 8 => 'eight', 9 => 'nine',
              10 => 'ten', 11 => 'eleven', 12 => 'tweleve', 13 => 'thirteen',
              14 => 'fourteen', 15 => 'fifteen', 16 => 'sixteen',
              17 => 'seventeen', 18 => 'eighteen', 19 => 'nineteen'
            }
  ans = int_hash.values.sort.map{|elem| int_hash.key(elem)}

end

p alphabetic_number_sort2((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
      