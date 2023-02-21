=begin
PEDAC PROCESS
P - Understanding the problem
  - The method takes 2 arguments
  - Output - returns true if exactly one of its argument is truthy, otherwise f

  Questions:
  - Do we need to validate input??
  - 
  -Explicit - Result should be in boolean instead of a truthy or falsy values
  - 

E - Examples:
  xor?(5.even?, 4.even?) == true
  xor?(5.odd?, 4.odd?) == true
  xor?(5.odd?, 4.even?) == false
  xor?(5.even?, 4.odd?) == false

D - Data structures 
  - None

A - Algorithm
    - Chek if each parameter belong to either true or false class and return

C - Code with intent - Consider the language limitations here
=end

def xor?(a, b)
  if a.class == TrueClass && b.class == FalseClass
    true
  elsif a.class == FalseClass && b.class == TrueClass
    true
  else
    false
  end
end

p xor?(5.even?, 4.even?) 
p xor?(5.odd?, 4.odd?)
p xor?(5.odd?, 4.even?) 
p xor?(5.even?, 4.odd?) 