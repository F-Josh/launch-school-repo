
=begin
PEDAC PROCESS
P - Understanding the problem
  - The method takes in a string
  - Output - returns true if string is palindrome, else false

  Questions:
  - What is palindrome? A A plandrome reads the same forward and backward
  - Do we need to validate input?

  Implicit
    - 
  Explicit 
  - Case matters as does punctuation and spaces

E - Examples:
  palindrome?('madam') == true
  palindrome?('Madam') == false          # (case matters)
  palindrome?("madam i'm adam") == false # (all characters matter)
  palindrome?('356653') == true

D - Data structures 
  - 

A - Algorithm
    - Define your method to accept a string
    - Validate the input if needed
    - Convert the string into a character array using chars
    - Create a temp array, copy the array from the back or use Array#reverse
    - Use the comparison operator to check for equality

C - Code with intent - Consider the language limitations here
=end

def palindrome?(word)
  return "Invalid argument" if word.class != String && word.class != Array
  counter1 = 0
  counter2 = word.size - 1
  while counter1 < counter2 
    return false if word[counter1] != word[counter2]
    counter1 += 1
    counter2 -= 1
  end
  true
end

def palindrome?(word)
  word == word.reverse
end

p palindrome?('madam') 
p palindrome?('Madam')        # (case matters)
p palindrome?("madam i'm adam")  # (all characters matter)
p palindrome?('356653')
p palindrome?(['madam', 'Madam']) 
