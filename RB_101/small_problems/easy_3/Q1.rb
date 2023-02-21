=begin
PEDAC PROCESS
P - Understanding the problem
  - The program will get 6 numbers from the users
  - Then print a message that describes whether or not the 6th number exits
  Questions:
  - How do we handle numbers? can we include 0, floating numbers
  - Implicit - 

E - Examples:
  => enter the first number: 25, 
  => enter the second number : 15,
  => enter the third number : 20,
  => enter the  forth : 18,
  => enter the fifth number : 30
  => enter the sixth  number : 15
  Print The number 15 appears in [25, 15, 20, 17, 23]

D - Data structures 
  - We will be using an array to store our numbers

A - Algorithm
    - Initialize an empty array for storing the numbers
    - Prompt the user for an input until array.size == 6
    - Validate user's input
    - IF the last input is already in the array, puts num already in array
    - ELSE - Put num no in the array

C - Code with intent - Consider the language limitations here
=end

def prompt(message)
  puts "==> #{message}"
end

def check?(arr, num)
  arr.include?(num)
end

def transform(num)
  case num
  when 1
    "1st"
  when 2
    "2nd"
  when 3
    "3rd"
  when 4
    "4th"
  when 5
    "5th"
  when 6
    "last"
  else
    "#{num}th"
  end
end

number_array = []
ans = false
number = ''

counter = 1
while counter <= 6 do
  prompt("Enter the #{transform(counter)} number:")
  number = gets.chomp.to_i
  next if number.class != Integer && number.class != Float

  break if number_array.size == 5
  number_array << number
  counter += 1
end

if number_array.include?(number)
  puts "The number #{number} appears in #{number_array}"
else
  puts "The number #{number} does not appear in #{number_array}"
end


