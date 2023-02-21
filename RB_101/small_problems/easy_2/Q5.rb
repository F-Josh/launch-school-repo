=begin
PEDAC
PEDA
  Inputs - 1 argument, get user name
  Outputs -  Greet the user

  Problem domain-  
  Explicit /Implicit - 
  -

  Questions- How do we handle empty strings

  Example:
    What is your name? Bob
    Hello Bob.

    What is your name? Bob!
    HELLO BOB. WHY ARE WE SCREAMING?

  DS- 

  Algorithm:
    - Ask user to enter name
    - If name.chop == !
    Puts output in Caps
  else
    puts "Hello"{Bob}
  end

Code with intent 
=end
def greet_user()
  puts "What is your name?"
  name = gets.chomp.strip
  greet_user() if name.class != String || name.empty?
  if name.chomp('!') != name
    puts "HELLO #{name.upcase}. WHY ARE YOU SCREAMING?"
  else
    puts "Hello #{name}"
  end
end
greet_user()
