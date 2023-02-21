=begin
PEDAC
PEDA
  Inputs - 2 arguments - age, and retirement date
  Outputs -  years left before retirement

  Problem domain-  
  Explicit /Implicit - Use the Time class from ruby core library
  -

  Questions- 

  Example:
    What is your age? 30
    At what age would you like to retire? 70

    It's 2016. You will retire in 2056.
    You have only 40 years of work to go!

  DS- 

  Algorithm:
    - Ask user for thier current age
    - Ask user for retirement age
    - validate your inputs to make sure they are integers
    - Do not accept 0s or negative for age
    - current year should be gotten from the Time class
    - Work age before retirment = retirement_age - current age
    - Retirement_year = current_year + work_age before retirement
    - Print current year and work year to go 

Code with intent 
=end

def retirement()
  puts "What is your age in years?"
  age = gets.chomp
  retirement() if age.to_i.to_s != age || age == 0
  puts "At what age will you like to retire? "
  retirement_age = gets.chomp
  retirement() if retirement_age.to_i.to_s != retirement_age || retirement_age == 0
  current_year = Time.now.year.to_i
  years_left = retirement_age.to_i- age.to_i
  retirement_year = current_year + years_left

  puts "It's #{current_year}. You will retire in #{retirement_year}."
  puts "You have only #{years_left} years of work to go!"
end
retirement()
