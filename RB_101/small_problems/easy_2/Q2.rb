=begin
PEDAC
PEDA
  Inputs - need 2 arguments from the user
  Outputs -  Print Area of the room in square meteres and square feet

  Problem domain-  1 Square meter == 10.7639 square feet

  Explicit /Implicit - Answers willl be in float, and don't validate input
  - 

  Questions- ?

  Example:
    Enter the length of the room in meters:
    10
    Enter the width of the room in meters:
    7
    The area of the room is 70.0 square meters (753.47 square feet).

    DS- 

  Algorithm:
    - Ask the user to enter length of the room in meteres
    - Ask the user to enter the width of the room in meters
    - Calculate the area of the room in square meters 
    - After that multiply the square meteres by 10.7639 to get square feet

Code with intent 
=end

def get_area()
  puts "Please enter the length of the room in meters:"
  length = gets.chomp.strip.to_f
  puts "Please enter the width of the room in meteres:"
  width = gets.chomp.strip.to_f
  area_in_square_meters = (length * width).round(2)
  area_in_square_feet = (area_in_square_meters * 10.7639).round(2)
  puts "The area of the room is #{area_in_square_meters} square meteres" + \
      " (#{area_in_square_feet} square feet)."
end
get_area()