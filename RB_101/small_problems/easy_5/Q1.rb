=begin
PEDAC PROCESS
P - Understanding the problem
  - Write a method that determines and returns the ASCII string value 
  - ASCII string value is the sum of the ASCII values of every character in the 
    string
    - Use String#ord to determine the ASCII value of a character

  Questions:
  - Do we have to to validate the method argument??
  - What is ASCII?
  - Do we consider spaces? yes because its a character
  - Does the method accept an empty string? yes

  -Explicit - 
  - Implicit - An empty string is allowed because it it's a character
     Returns an integer
     - The method accepts an empty string

E - Examples:
  ascii_value('Four score') == 984
  ascii_value('Launch School') == 1251
  ascii_value('a') == 97
  ascii_value('') == 0
  

D - Data structures 
  - N/A

A - Algorithm
    - Define your method to accept a string argument
    - Declare a local variable named ascii_sum = 0
    - First deal -Return ascii_sum if string_argument  is and empty string
    - Convert the string to an array of characters using Strig#chars method
    - Iterate over the array using Arra#each method and pass in a block argum
    - While iterating, use the String#ord method to get the ascii value of
       each character and it to ascii_sum
    - Return sum

C - Code with intent - Consider the language limitations here
=end

def ascii_value(string)
  ascii_sum = 0
  return ascii_sum if string == ''
  char_arr = string.chars
  char_arr.each{ |elem| ascii_sum += elem.ord}
  ascii_sum
end

# Further exploration

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0