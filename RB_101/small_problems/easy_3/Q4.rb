=begin
PEDAC PROCESS
P - Understanding the problem
  - The method will take 2 arguments
  - Output - The result of multiplying both arguments
  Questions:
  - Do we need to validate input?? 
  - Can the argument be a string or integer? or anything?

  -Explicit - 
  -Implicit - The arguments are expected to be valid numbers

E - Examples:
  multiply(5, 3) == 15

D - Data structures 
  - None

A - Algorithm
    - Define your method with 2 parameters
    - Validate parameters if required
    - multiply both parameters and return the result

C - Code with intent - Consider the language limitations here
=end
def multiply(param1, param2)
  param1 * param2
end
p multiply([1, 2, 3], 1)
