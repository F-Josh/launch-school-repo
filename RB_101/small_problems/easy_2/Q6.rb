=begin
PEDAC
PEDA
  Inputs - 
  Outputs -  Print all odd numbers from 1 to 99

  Problem domain-  
  Explicit /Implicit - 
  -

  Questions- 

  Example:
   

  DS- 

  Algorithm:
    - Use the range method to print all od and pass in a block to print all odd

Code with intent 
=end

def print_odd()
  (1..99).each {|num|  puts num if num % 2 == 1}
end
print_odd()