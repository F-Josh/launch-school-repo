=begin
PEDAC
PEDA
  Inputs - 1 argument - a string containing 1 or more words.
  Outputs -  Return the string but with words that have 5 or more characters
  reversed
  Problem domain- 
  Explicit /Implicit - An empty string is considered valid.
  - Each string will consist of only letters and spaces
  - spaces should be included only when more than 1 word is present
  Questions- How do you handle an empty string? is it valid?

  Example:
  puts reverse_words('Professional')          # => lanoisseforP
  puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
  puts reverse_words('Launch School')         # => hcnuaL loohcS
  
  D/S = Array

  Algorithm:
    - Validate your input
    - Strip to get rid of whitespaces
    - Create a seperation sub routine for reversing a characters of a string
    - Call the split method to get the substrings
    - Iterate over the returned array using a map
    - Pass a block that checks if the size of the element is >= 5
    - If yes, call the reverse_sentence subroutine
    - Replace self with the returned value from the subroutine and join

Code with intent 
=end


def reverse_string(words)
  puts "Invalid argument(please enter a string)" if words.class != String
  words = words.strip
  reversed_strings = []
  char_array = words.chars
  while char_array.size != 0
    reversed_strings << char_array.pop
  end
  reversed_strings.join
end

def reverse_words(word)
  puts "Invalid argument(please select a string)" if word.class != String
  words = word.strip

  words_array = words.split
  words_array.each do |elem|  
    if elem.size >= 5
      reverse_word = reverse_string(elem)
      words_array[words_array.index(elem)] = reverse_word
    end
  end
  words_array.join(" ")
end

puts reverse_words('Professional')
puts reverse_words('Walk around the block')
puts reverse_words('Launch School')
puts reverse_words('      heloppppp')