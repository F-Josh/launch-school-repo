=begin
PEDAC
PEDA
  Inputs - Integer from user to enter a number, ask for sum/ product
  Outputs -  Display sum if user entered s and product if user entered p

  Problem domain-  
  Explicit /Implicit - Must be integer > 0
  -

  Questions- 

  Example: 
  >> Please enter an integer greater than 0:
  5
  >> Enter 's' to compute the sum, 'p' to compute the product.
  s
  The sum of the integers between 1 and 5 is 15.


  >> Please enter an integer greater than 0:
  6
  >> Enter 's' to compute the sum, 'p' to compute the product.
  p
  The product of the integers between 1 and 6 is 720.
   

  DS- 

  Algorithm:
    - Ask the user to enter an integer > 0
    - Validate if number > 0 and Integer
    - Ask user to enter s to compute sum or p to compute product
    - output based on user's choice

Code with intent 
=end

def sum_mul()
  puts "=> Enter an integer greater than 0:"
  number = gets.chomp.to_i
  sum_mul() if number.class != Integer || number <= 0
  puts "=> Enter 's' to compute sum, 'p' to commputer product."
  choice = gets.chomp.downcase.strip
  choices = ['p', 's']
  sum_mul() if choice.class != String || choices.include?(choice) == false

  sum = (1..number).inject(:+)
  product =(1..number).inject(:*)

  if choice == 's'
    puts "The sum of the integers between 1 and #{number} is #{sum}"
  elsif choice == 'p'
    puts "The product of integers between 1 and #{number} is #{product}"
  end
end
sum_mul()

