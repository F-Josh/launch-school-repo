=begin
PEDAC PROCESS
P - Understanding the problem
  - String of words seperated by space
  - Write a method that takes the string of words and return a string in which 
    - the first and last letters of wvery word are swapped.
  - Input - String of words
  - Output - string of words
  

  Questions:
  - None

  -Explicit :
    - You may assume that every word contains at least one letter
    - You may assume that the string will always contain at least one word
    - Each string contains only words and spaces.
  - Implicit - 

E - Examples:
  swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
  swap('Abcde') == 'ebcdA'
  swap('a') == 'a'
  

D - Data structures 
  - Array - That will hold each swapped word before joining
  - String -  if we do not want an array

A - Algorithm
    - Define helper mthod that takes a string and swap the first and last letter
       - intialize a variable temp = word[0]
       - word[0] = word[1]
       - word[1] = temp
      - Define a method that will accept a string of word/words
      - initialize a local variable str = an empty string
      -  Initialze a local variable and set it to the value of spliting words
      - Initialize a local variable ans = []
      - iterate over the spllited words using each method
       - call the swap method on each word and push the result to ans
       - return ans.join(' ') to return a string delimited at ' '
       - END
      - 
    - 

C - Code with intent - Consider the language limitations here
=end

def swap_letter(word)
  temp = word[0]
  word[0] = word[-1]
  word[-1] = temp
  word
end

def swap_words(words)
  final_string = ''
  swap_arr = []
  word_arr = words.split
  # you can also use a map to iterate and manipulate
  word_arr.each do |element|
    swapped_word = swap_letter(element)
    #swap_arr << swapped_word
    final_string += swapped_word + ' '
  end
  #swap_arr.join(' ')
  final_string = final_string.strip
end

p swap_words('Oh what a wonderful day it is')
p swap_words('Abcde') == 'ebcdA'
p swap_words('a') == 'a'
