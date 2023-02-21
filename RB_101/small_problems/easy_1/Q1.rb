=begin
PEDAC
PEDA
  Inputs - 2 arguments,  a string and a positive integer
  Outputs - Print the strings as many times as the integer indicates
  Questions- How do we handle an empty string and 0??
  Example repeat('Hello', 3) => 'Hello', 'Hello', 'Hello'
  DS - None
  Algorithm:
    First validate number
    keep a counter for keeping track of the number of loops
    Use a while,until loop to print string
    break if the condition is met, and increment also
    You can also use the times method to print

Code with intent 
=end 

def valid_num?(num)
  num.to_s.to_i == num
  # Integer(num) rescue false
  
end

def repeat(word, num)
  if valid_num?(num)
    counter = 0
    while counter < num
      puts word
      counter += 1
    end
  else
    puts "Not a valid Integer"
  end
end
repeat('Hello', 2)
  