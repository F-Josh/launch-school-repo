=begin
PEDAC PROCESS
P - Understanding the problem
  - A method that takes 2 strings as argument
  - Determines the longest of the 2 strings
  - Return the result of concatenation the shorter string, the longer string
    then the shorter string again.
  - Strings are different length
  Input - 2 strings
  Output - Concatenated string

  Questions:
  - Do we need to validate input to make sure its a string??
  - What of empty strings?

  -Explicit - The strings are of different  length
  - Implicit - It accepts an empty string

E - Examples:
  short_long_short('abc', 'defgh') == "abcdefghabc"
  short_long_short('abcde', 'fgh') == "fghabcdefgh"
  short_long_short('', 'xyz') == "xyz"
  

D - Data structures 
  - None or you can use an Array to hold the strings

A - Algorithm
    - Define your method with two parameters(a, b)
    - if a.size > b.size then b + a + b
    - else a + b + a
    - END 

C - Code with intent - Consider the language limitations here
=end

def short_long_short(string1, string2)
  if string1.size > string2.size
    string2 + string1 + string2
  else
    string1 + string2 + string1
  end
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"
