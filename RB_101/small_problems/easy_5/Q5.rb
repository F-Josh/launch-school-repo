=begin
PEDAC PROCESS
P - Understanding the problem
  - We are given a string consist of some words with non - alpha characters
  - Write a method that returns that string with all the non -alpha characters
  - Replaced with spaces. 
  - If one of more alpha characters occur, replace with only a single space
  - Input - A string of words with non-alpha characters
  - Output -  string of words with the non-alpha characters replaced 
  - with a single space
  

  Questions:
  - Are we to return a new string or modify the old one?

  -Explicit :
    - The input are all lowercased
    - Result should never have consecutive spaces
  - Implicit - 

E - Examples:
  swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
  swap('Abcde') == 'ebcdA'
  swap('a') == 'a'
  

D - Data structures 
  - Array - It will be used to store the cleaned words

A - Algorithm
    - We will first break the problem into what we can solve
    - Define a helper method that will iterate over each character in a word
    - Initialize an array of Alphabets = ('a'..z).to_a
      replacing the non -aplha character with spaces and return the string
    - Define a clean method with parameter
      
      - Initiliaze an an empty array
      - intialize a string pre_cleaned_words = helper_method(str)
      - Iterate over the pre_cleaned_words using chars with a block argument
        - For each char if the char a member of alphabet, push each char into
        the empty array unless arr.last == ' '
      - Return array.join
      

C - Code with intent - Consider the language limitations here
=end

# Helper method that will replace non alphabet characters with spaces
def replace_chars(words)
  alphabets = ('a'..'z').to_a #an array of lower_case characters
  new_words = words.chars.map do |char|
   char = ' ' if !alphabets.include?(char)
   char
  end
  new_words.join
end

def cleanup(words)
  alphabets = ('a'..'z').to_a
  clean_arr = []
  words.chars.each do |elem|
    if alphabets.include?(elem)
      clean_arr << elem
    else
     clean_arr << ' ' unless clean_arr.last == ' '
    end
  end
  clean_arr.join
end

def cleanup2(words)
  clean_word = words.gsub(/[^a-z]/, ' ')
  final_string = clean_word.squeeze(' ')
end

p cleanup2("---what's my +*& line?")