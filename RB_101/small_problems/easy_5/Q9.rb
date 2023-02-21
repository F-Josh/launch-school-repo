
=begin
PEDAC PROCESS
P - A method that takes a string argument a
    Return a new string that contains the value of the orginal string 
    with all consecutive duplicate characters collapsed into a single char
    Input - A a string argument
    Output - A new string
  
  
  Questions:
  - Do we have to validate the input?

  -Explicit :
  - Implicit -  Edge case an empty string will return an empty string

E - Examples:
  crunch('ddaaiillyy ddoouubbllee') == 'daily double'
  crunch('4444abcabccba') == '4abcabcba'
  crunch('ggggggggggggggg') == 'g'
  crunch('a') == 'a'
  crunch('') == ''

D - Data structures 
  - a String

A - Algorithm
    - Define your method to accept string argument str
    - Deal with edge case - If argument is an empty string, return argument
    - Initialze a local variable and set it to str[0]
    - Initialize a variable counter and set it to 0
    - Loop do
      break if str.size = counter
        concatenate new_str += str[counter] unless str[counter -1] == str[count]
    end
    return new_str

C - Code with intent - Consider the language limitations here
=end

def crunch(str)
  return '' if str == ''
  count = 1
  new_str = str[0]
  loop do
    break if count == str.size
    new_str += str[count] unless str[count - 1] == str[count]
    count += 1
  end
  new_str
end

p crunch('ddaaiillyy ddoouubbllee')
p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''




