=begin
PEDAC PROCESS
P - Understanding the problem
  - Write a method that takes year as input
  - Returns the century
  Input - 1, year which should be an integer
  Output - String that begins with the century number and ends with st, nd,
  or th, as appropriate

  Questions:
  - Do we have to to validate the method argument??
  - What is a century and how do you determine that??
  - 

  -Explicit - The The return value will be a string
  - Implicit - 

E - Examples:
  century(2000) == '20th'
  century(2001) == '21st'
  century(1965) == '20th'
  century(256) == '3rd'
  century(5) == '1st'
  century(10103) == '102nd'
  century(1052) == '11th'
  century(1127) == '12th'
  century(11201) == '113th'
  

D - Data structures 
  - 

A - Algorithm
    - Define your method with a single parameter
    - If the year is a multiple of 100, xentury is year / 100
    - Else century = year / 100 + 1
    - Perform an extra check for the last 2 digits of century
    - If the last 2 digits endswith? 11, 12, 13
    
    - Convert century to a string and call on the endwith? method
    - Use a case statemenet to asign st, nd, rd, th depends on the end of str
    - return century in string form with the appended part

C - Code with intent - Consider the language limitations here
=end


def century(year)
  century = year / 100 # Note that this keeps a track of just the quotient
  if year % 100 != 0
    century += 1
  end
  century.to_s + century_suffix(century)
end

def century_suffix(century)
  return 'th' if [11, 12, 13].include?(century % 100)
  last_digit = century % 10

  case last_digit
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  else 'th'
  end
end


p century(11201)