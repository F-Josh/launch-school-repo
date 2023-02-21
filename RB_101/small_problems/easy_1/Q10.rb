=begin
PEDAC
PEDA
  Inputs - 2 arguments - 1 arguments, positive integer and boolean
  Outputs -  Return half of salary if te boolean == true else 0

  Problem domain-  An integer is a whole number and can be positive or negative
  Explicit /Implicit - Output should be a foating value for salaries
  - Salary can't be 0

  Questions- Can salaries be 0?

  Example:
    puts calculate_bonus(2800, true) == 1400
    puts calculate_bonus(1000, false) == 0
    puts calculate_bonus(50000, true) == 25000= 40

  DS- 

  Algorithm:
    - validate both inputs
    - If second argument == true, return salary / 2.0
    - Else return 0 

Code with intent 
=end

def calculate_bonus(salary, status)
  if salary.class != Integer || salary <= 0
    return "Wrong salary value, please enter a valid Integer or float value"
  elsif status == false
    return 0
  else
    return salary / 2
  end
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000