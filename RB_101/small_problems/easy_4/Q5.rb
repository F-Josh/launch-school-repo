=begin
PEDAC PROCESS
P - Understanding the problem
  - Write a method that takes year as input and determines whether
  - it's a leap year pre gregorian calendar and post Gregorian calendar or not
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
  

D - Data structures
  - N/A

A - Algorithm
    - Define a method for Gregorian calender to check for leap year
      - If year is divisible by 4 && year is not divisible by 100
        return true
      - elsif year is divisible by 100 & year is divisible by 400
       return true
      - else return  false
      - end
    Define a method for Julian  calendar
      - If year is evenly dvisible by 4 then it's a leap year

C - Code with intent - Consider the language limitations here
=end

def leap_year?(year)
  if year > 1751 
    if year % 4 == 0 && year % 100 != 0
      true
    elsif year % 400 == 0
      true
    else
      false
    end
  else
    year % 4 == 0
  end 
end

def leap_year?(year)
  condition_1 = year < 1752 && year % 4 == 0
  condition_2 = year % 4 == 0 && year % 100 != 0
  condition_3 = year % 400 == 0

  condition_1 || condition_2 || condition_3
end


def valid_modulo?(year, cycle)
  year % cycle == 0
end

def gregorian_leap_year?(year)
  secondary_check = valid_modulo?(year, 100) ? valid_modulo?(year, 400) : true

  valid_modulo?(year, 4) ? secondary_check : false
end

def leap_year?(year)
  year <= 1752 ? valid_modulo?(year, 4) : gregorian_leap_year?(year)
  end
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
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true

