=begin
PEDAC PROCESS
P - Understanding the problem
  - Get input from the user, word or multiple words string
  - Output - number of characters
  Questions:
  - Do we need to validate input??
  - How do we deal with empty strings, are they valid?
  -Explicit - Spaces should not be counted as characters
  - 

E - Examples:
  Please write word or multiple words: walk
  Therer are 4 characters in walk

D - Data structures 
  - None

A - Algorithm
    - First will be to get an inout from the user. No need for validation
    - Beacuse user inputs are always string
    - Use the chars method to get an array of characters.
    - Keep a counter for keeing track of the count of character
    - Iterate through the array and count the number of characters excl spaces
    - Increment count while iterating and excluding spaces
    - Return count

C - Code with intent - Consider the language limitations here
=end

def count_char()
  puts "Please write word or multiple words:"
  words = gets.chomp.strip # used strip to get rid of empty spaces
  char_array = words.chars
  count = 0
  char_array.each {|ch| count += 1 if ch != ' '}
  "There are #{count} characters in \"#{words}\"."
end

puts count_char()