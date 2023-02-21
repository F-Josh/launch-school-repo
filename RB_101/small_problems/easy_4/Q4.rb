=begin
PEDAC PROCESS
P - Understanding the problem
  - Write a method that takes year as input and determines whether
  - it's a leap year or not
  - Input - an integer
  - Output - Boolean

  Questions:
  - Do we have to to validate the method argument??
  - 

  -Explicit - The integer will be > 0
  - Implicit - 

E - Examples:
  leap_year?(2016) == true
  leap_year?(2015) == false
  leap_year?(2100) == false
  leap_year?(2400) == true
  leap_year?(240000) == true
  

D - Data structures 
  - N/A

A - Algorithm
    - If year is divisible by 4 && year is not divisible by 100
        return true
    - elsif year is divisible by 100 & year is divisible by 400
       return true
    - else return  false
    - end

C - Code with intent - Consider the language limitations here
=end