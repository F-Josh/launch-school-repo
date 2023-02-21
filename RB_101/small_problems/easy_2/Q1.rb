=begin
PEDAC
PEDA
  Inputs - None
  Outputs -  Prints age
  Problem domain-  
  Explicit /Implicit - 

  Questions- 

  Example:
    Teddy is 69 years old!

  DS- 

  Algorithm:
    - Define a randome age method without a parameter
    - Use the Kernal#rand method to generate random numbers between 20 and 200
    - Print your output using string interpolation

Code with intent 
=end

def get_teddy_age()
  puts "Please enter you name?"
  name = gets.chomp.strip
  age = rand(20..200)
  if name.empty?
    name = "Teddy"
  end
  puts "#{name} is #{age} years old!"
end
get_teddy_age()

