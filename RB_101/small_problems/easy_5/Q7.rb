=begin
PEDAC PROCESS
P - Wrte a method that takes a string of word/seperated words
  - - Returns a hash that shows the number of words of d/f sizes
  - Exclude non-letters
  

  Questions:
  - Do we need to validate the input?
  - How do we address an empty string?

  -Explicit :
    - Words consists of any string of characters that do not include spaces
  - Implicit - 

E - Examples:
  word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
  word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
  word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
  word_sizes('') == {}
  
  

D - Data structures 
  - a Hash that will keep track of the number of word and its occurence

A - Algorithm
    - Define your method to accept string argument
    - Initialze an empty hash that will hold the final result
    - Split the string and initialize an array that will keep track of 
      word count using the map method
    - Iterate over the array above with the each method making each element
        in the array as the key to the hash and value should be the count of that
        element in the array above using Array#count method
    - Return the hash

      

C - Code with intent - Consider the language limitations here
=end

def word_sizes(words)
  sizes_hash = {}
  word_sizes = words.split.map {|word| word.delete('^a-zA-Z').size}

  word_sizes.each {|elem| sizes_hash[elem] = word_sizes.count(elem)}
  sizes_hash
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}