=begin
PEDAC
PEDA
  Inputs - 1 argument - a string
  Outputs - a new string with words in reverse order
  Problem domain- 
  Explicit /Implicit - An empty string is considered valid.
  - Any number of spaces results in ''

  Example:
  puts reverse_sentence('Hello World') == 'World Hello'
  puts reverse_sentence('Reverse these words') == 'words these Reverse'
  puts reverse_sentence('') == ''
  puts reverse_sentence('    ') == '' # Any number of spaces results in ''

  Data Structures - Array 
  Algorithm:
    - Initialize an empty array for holding our answer
    - spilt the exisiting string, then pop the item from the exixting string
    - into the new array using the Array#unshift method
    - return our new array

Code with intent 
=end

def reverse_sentence(words)
  puts "Invalid argument(please enter a string)" if words.class != String
  reversed_words = []
  words_array = words.split
  while words_array.size != 0
    reversed_words << words_array.pop
  end
  reversed_words.join(" ")
end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''
