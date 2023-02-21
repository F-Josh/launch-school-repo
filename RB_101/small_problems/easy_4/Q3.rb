
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



def leap_year?(year)
  if year % 4 == 0 && year % 100 != 0
    true
  elsif year % 400 == 0
    true
  else
    false
  end
end

def leap_year?(year)
  div_4 = year % 4 == 0
  div_100 = year % 100 == 0
  div_400 = year % 400 == 0

  (div_400) || (div_4 && !div_100)
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true